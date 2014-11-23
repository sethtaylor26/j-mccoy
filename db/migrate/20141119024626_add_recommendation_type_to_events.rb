class AddRecommendationTypeToEvents < ActiveRecord::Migration
  def change
  	add_reference :events, :recommendation_type, index: true
  end
end
