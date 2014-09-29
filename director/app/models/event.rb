class Event < ActiveRecord::Base
  belongs_to :event_type
  validates :event_type_id, presence: true
  
  belongs_to :recommender
  
  scope :start_time, -> (start_time) { where("start_time >= ?", start_time) }
  scope :end_time, -> (end_time) { where("end_time <= ?", end_time) }
  scope :cost, -> (cost) { where("cost <= ?", cost) }
  scope :spice, -> (spice) { where("spice <= ?", spice) }
  scope :title, lambda{|l|  where("title LIKE :l", l: "%#{l}%")}
  
  #def self.search(query)
  
  #	where("title like ?", "%#{query}%")
  #end
end
