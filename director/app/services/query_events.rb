class QueryEvents

  def call(params)

    @params = params

    #rlst = validate
    #return rslt unless rslt.success

    #initialize_query
    debugger
    filter
    #filter_start_time
    #filter_end_time
    #filter_cost
    #filter_spice
    #find_top_events_by_weight
    result(true, nil, @events + @events_hrs)
  end

  #def initialize_query
  #	@events     = Event.where(general_hours: false)
  #  @events_hrs = Event.where(general_hours: true)
  #end

  #def validate
  #  [:start_time, :end_time].each do |param|
  #    if @params[param].nil?
  #      return result(
  #          false,
  #          {params: ['start_time must be present', 'end time must be present']}
  #      )
  #    end
  #  end
  #end

  def result(success, error, obj)
    Struct.new(:success, :error, :obj).new(success, error, obj)
  end

  def filter

    @events     = Event.where(general_hours: false)
    @events_hrs = Event.where(general_hours: true)

    # static
    start_time = DateTime.parse(@params[:start_time])
    end_time = DateTime.parse(@params[:end_time])

    @events = @events
      .where("start_time >= ?", start_time)
      .where("end_time <= ?", end_time)
      .where("cost <= ?", @params[:cost])
      .where("spice <= ?", @params[:spice])

    # general
    day = start_time.strftime('%A')
    time = start_time.to_s(:time)
    @events_hrs = @events_hrs
      .joins(:open_hours)
      .where(open_hours: {day_of_the_week: day})
      .where('open_hours.open_hour <= ?', time)
      .where("cost <= ?", @params[:cost])
      .where("spice <= ?", @params[:spice])

  end

  def static_hours(obj)
    obj
      .where("start_time >= ?", start_time)
      .where("end_time <= ?", end_time)
      .where("cost <= ?", @params[:cost])
  end

  def filter_start_time
  	return unless @params[:start_time].present?

    # static
    start_time = DateTime.parse(@params[:start_time])
  	@events
      .where("start_time >= ?", start_time)
      .where("end_time <= ?", end_time)

    # general
    day = start_time.strftime('%A')
    time = start_time.to_s(:time)
    @events_hrs = @events_hrs
      .joins(:open_hours)
      .where(open_hours: {day_of_the_week: day})
      .where('open_hours.open_hour <= ?', time)
  end


  def filter_end_time
    return unless @params[:end_time].present?

    end_time = DateTime.parse(@params[:end_time])
    @events = @events.where("end_time <= ?", end_time)

    day = end_time.strftime('%A')
    time = end_time.to_s(:time)

    @events_hrs = @events_hrs
      .joins(:open_hours)
      .where(open_hours: {day_of_the_week: day})
      .where('open_hours.close_hour >= ?', time)
  end

  def filter_general_hours
    
  end

  def filter_cost
  	return unless @params[:cost].present?
  	@events = @events.where("cost <= ?", @params[:cost])
  end

  def filter_spice
  	return unless @params[:spice].present?
  	@events = @events.where("spice <= ?", @params[:spice])
  end

  def find_top_events_by_weight
  	return unless @params[:top_events]
    #@event_type_answer_weights = EventTypeAnswerWeight.where(nil)
    #@user_answers = UserAnswer.joins(potential_answer: :event_type_answer_weights)
    
    #@event_type_answer_weights = EventTypeAnswerWeight.joins(:user_answers)
    #@event_type_weights = EventTypeAnswerWeight.joins("INNER JOIN user_answers ON user_answers.potential_answer_id = event_type_answer_weights.potential_answer_id").group("event_type_id")
  end
end
