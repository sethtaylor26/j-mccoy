class EventTypeAnswerWeight < ActiveRecord::Base
  belongs_to :potential_answer
  belongs_to :event_type
end
