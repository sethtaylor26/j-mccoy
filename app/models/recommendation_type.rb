class RecommendationType < ActiveRecord::Base
  validates :rec_type, presence: true
  validates :descr, presence: true
end
