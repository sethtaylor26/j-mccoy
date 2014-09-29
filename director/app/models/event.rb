class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :recommender
  
  def self.search(query)
  	where("title like ?", "%#{query}%")
  end
end
