class MakeEventTypePotentialAnswerIdsNotNull < ActiveRecord::Migration
  def change
    change_column :event_type_answer_weights, :potential_answer_id, :integer, :null => false
    change_column :event_type_answer_weights, :event_type_id, :integer, :null => false
  end
end
