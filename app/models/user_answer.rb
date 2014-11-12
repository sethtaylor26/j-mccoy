class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :potential_answer
  
  validates :user_id, presence: true
  validates :potential_answer_id, presence: true
	
end
