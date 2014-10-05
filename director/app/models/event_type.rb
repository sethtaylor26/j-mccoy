class EventType < ActiveRecord::Base
  has_many :event_type_answer_weights
end
