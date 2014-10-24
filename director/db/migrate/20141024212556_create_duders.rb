class CreateDuders < ActiveRecord::Migration
  def change
    create_table :duders do |t|
      t.boolean :pants

      t.timestamps
    end
  end
end
