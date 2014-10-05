class CreatePotentialAnswers < ActiveRecord::Migration
  def change
    create_table :potential_answers do |t|
      t.references :questions, index: true
      t.text :answer
      t.integer :answer_weight

      t.timestamps
    end
  end
end
