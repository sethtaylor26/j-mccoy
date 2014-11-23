json.array!(@user_answers) do |user_answer|
  json.extract! user_answer, :id, :user_id, :potential_answer_id
  json.url user_answer_url(user_answer, format: :json)
end
