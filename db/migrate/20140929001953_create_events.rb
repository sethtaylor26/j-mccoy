class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :event_type, index: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.string :short_review
      t.text :long_review
      t.string :web_site_url
      t.float :location_lat
      t.float :location_long
      t.string :address
      t.integer :spice
      t.integer :cost
      t.references :recommender, index: true
      t.string :image_url
      t.text :comments

      t.timestamps
    end
  end
end
