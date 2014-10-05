json.array!(@potential_answers) do |potential_answer|
  json.extract! potential_answer, :id, :questions_id, :answer, :answer_weight
  json.url potential_answer_url(potential_answer, format: :json)
end
