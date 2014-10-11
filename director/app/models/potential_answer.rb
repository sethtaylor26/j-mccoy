class PotentialAnswer < ActiveRecord::Base
  belongs_to :question
  has_many :event_type_answer_weights
  has_many :user_answers
  
  validates :answer, presence: true
end
