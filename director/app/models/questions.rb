class Questions < ActiveRecord::Base
  has_many :potential_answers
  
  scope :question_type, -> (question_type) { where("question_type = ?", question_type) }
end
