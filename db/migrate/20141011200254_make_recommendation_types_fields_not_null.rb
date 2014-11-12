class MakeRecommendationTypesFieldsNotNull < ActiveRecord::Migration
  def change
    change_column :recommendation_types, :rec_type, :string, :null => false
    change_column :recommendation_types, :descr, :text, :null => false
  end
end