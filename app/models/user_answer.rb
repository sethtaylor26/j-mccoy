class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :potential_answer
  
  validates :user_id, presence: true
  validates :potential_answer_id, presence: true
	
  def display_name
  	user.email + " " + potential_answer.question.question + " " + potential_answer.answer
  end
end
