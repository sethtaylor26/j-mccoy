class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :question_type, :potential_answers
end
