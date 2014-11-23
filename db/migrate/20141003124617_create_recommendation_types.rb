class CreateRecommendationTypes < ActiveRecord::Migration
  def change
    create_table :recommendation_types do |t|
      t.string :rec_type
      t.text :descr

      t.timestamps
    end
  end
end
