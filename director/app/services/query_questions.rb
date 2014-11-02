class QueryQuestions

  def call(params)

	@params = params

  	initialize_query
  	filter_question_type
  	result(true, nil, @questions)
  end

  def initialize_query
    @questions = Question.where(nil)
  end

  def filter_question_type
  	return unless @params[:question_type].present?
  	@questions = @questions.where("question_type = ?", @params[:question_type])
  end

  def result(success, errors = nil, obj = nil)
    Struct.new(:success, :errors, :obj).new(
      success, errors, obj
    )
  end

end