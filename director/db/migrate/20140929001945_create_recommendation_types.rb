class CreateRecommendationTypes < ActiveRecord::Migration
  def change
    create_table :recommendation_types do |t|
      t.string :type
      t.text :descr

      t.timestamps
    end
  end
end
