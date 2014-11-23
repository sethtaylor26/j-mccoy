class RecommendationType < ActiveRecord::Base
  validates :rec_type, presence: true
  validates :descr, presence: true

  has_many :events

  def display_name
  	descr
  end
end
