class EventTypeAnswerWeightSerializer < ActiveModel::Serializer
  attributes :id, :potential_answer, :event_type, :weight
end
