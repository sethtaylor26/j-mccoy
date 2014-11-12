class CreateOpenHours < ActiveRecord::Migration
  def change
    create_table :open_hours do |t|
      t.references :event, index: true, :null => false
      t.string :day_of_the_week, :null => false
      t.time :open_hour, :null => false
      t.time :close_hour, :null => false

      t.timestamps
    end
  end
end
