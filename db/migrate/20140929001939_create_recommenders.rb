class CreateRecommenders < ActiveRecord::Migration
  def change
    create_table :recommenders do |t|
      t.string :first_name
      t.string :last_name
      t.text :desc

      t.timestamps
    end
  end
end
