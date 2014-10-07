class EventType < ActiveRecord::Base
  has_many :event
  has_many :event_type_answer_weight
end
