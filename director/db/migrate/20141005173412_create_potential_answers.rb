class CreatePotentialAnswers < ActiveRecord::Migration
  def change
    create_table :potential_answers do |t|
      t.references :question, index: true, :null => false
      t.text :answer, :null => false

      t.timestamps
    end
  end
end