class Question < ActiveRecord::Base
  has_many :potential_answers
  QUESTION_TYPES = ['YN', 'EO']
  validates_inclusion_of :question_type, :in => QUESTION_TYPES
  validate :question, presence: true
  
end
