json.array!(@questions) do |question|
  json.extract! question, :id, :question, :question_type, :potential_answers	
  json.url question_url(question, format: :json)
end
