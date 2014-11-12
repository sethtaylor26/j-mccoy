class CreateEventTypeAnswerWeights < ActiveRecord::Migration
  def change
    create_table :event_type_answer_weights do |t|
      t.references :potential_answer, index: true
      t.references :event_type, index: true
      t.integer :weight

      t.timestamps
    end
  end
end