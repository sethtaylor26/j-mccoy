class Recommender < ActiveRecord::Base
  has_many :events
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :descr, presence: true

  def display_name
  	first_name + " " + last_name
  end
end
