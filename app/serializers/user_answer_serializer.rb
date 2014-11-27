class UserAnswerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :potential_answer_id, :created_at, :updated_at
end
