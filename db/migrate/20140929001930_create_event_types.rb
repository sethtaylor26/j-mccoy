class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :Type
      t.integer :Parent
      t.string :Image

      t.timestamps
    end
  end
end
