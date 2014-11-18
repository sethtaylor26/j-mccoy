class QueryEvents

  def call(params, user)
    @user = user
    @params = params

    rslt = validate
    unless rslt.success
      return rslt
    end
    
    initialize_query
    logistics_filter

    @initial_list = @events + @events_hrs

    filter_top_events_by_weight

    result(true, nil, @list_prefs)
  end

  def initialize_query
  	@events     = Event.where(general_hours: false)
    @events_hrs = Event.where(general_hours: true)
  end

  def logistics_filter
    return unless @params[:start_time].present? and
      @params[:end_time].present?

    # static
    start_time = DateTime.parse(@params[:start_time]) if @params[:start_time].present?
    end_time = DateTime.parse(@params[:end_time]) if @params[:end_time].present?

    @events = @events
      .where("start_time >= ?", @params[:start_time])
      .where("end_time <= ?", @params[:end_time])
      .where("cost <= ?", @params[:cost])
      .where("spice <= ?", @params[:spice])

    # general
    start_day = start_time.strftime('%A')
    end_day = end_time.strftime('%A')

    start_hour = start_time.to_s(:time)
    end_hour = end_time.to_s(:time)
    @events_hrs = @events_hrs
      .joins(:open_hours)
      .where(open_hours: {day_of_the_week: start_day})
      .where(open_hours: {day_of_the_week: end_day})
      .where('open_hours.open_hour <= ?', start_hour)
      .where('open_hours.close_hour >= ?', end_hour)
      .where("cost <= ?", @params[:cost])
      .where("spice <= ?", @params[:spice])

  end

  def result(success, errors = nil, obj = nil)
    Struct.new(:success, :errors, :obj).new(
      success, errors, obj
    )
  end

  def validate
    errors = []
    
    #"controller"=>"events", "action"=>"index"
    if @params[:controller] == 'events' and
       @params[:action] == 'index' and
       @params[:start_time].nil? and
       @params[:end_time].nil? and
       @params[:cost].nil? and
       @params[:spice].nil?
      return result(true)
    end

    if @params[:start_time].nil?
      errors << 'start_time must be provided'
    end
    if @params[:end_time].nil?
      errors << 'end_time must be provided'
    end
    if @params[:cost].nil?
      errors << 'cost must be provided'
    end
    if @params[:spice].nil?
      errors << 'spice must be provided'
    end    

    if errors.length > 0
      return result(false, 
        errors
      )
    else
      return result(true)
    end
  end

  def filter_top_events_by_weight

    @etaw = EventTypeAnswerWeight
      .select('event_type_answer_weights.event_type_id, sum(event_type_answer_weights.weight) as total')
      .joins(:user_answers)
      .where('user_answers.user_id = ?', @user.id)
      .group('event_type_answer_weights.event_type_id')
      .order('total DESC')

    count = 3
    if @params[:count].present?
      count = @params[:count].to_i
    end

    @list_prefs ||= []
    
    @etaw.each do |i|
      @initial_list.each do |l|
        if l.event_type_id == i.event_type_id
          @list_prefs << l
        end
        if @list_prefs.length >= count
          break
        end
      end
      if @list_prefs.length >= count
        break
      end
    end

  end
end
