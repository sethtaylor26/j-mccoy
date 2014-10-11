class Recommender < ActiveRecord::Base
  has_many :events
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :descr, presence: true
end
