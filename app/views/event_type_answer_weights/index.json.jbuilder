json.array!(@event_type_answer_weights) do |event_type_answer_weight|
  json.extract! event_type_answer_weight, :id, :potential_answer_id, :event_type_id, :weight
  json.url event_type_answer_weight_url(event_type_answer_weight, format: :json)
end
