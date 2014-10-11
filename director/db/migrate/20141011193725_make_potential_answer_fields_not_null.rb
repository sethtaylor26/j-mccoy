class MakePotentialAnswerFieldsNotNull < ActiveRecord::Migration
  def change
    change_column :potential_answers, :question_id, :integer, :null => false
    change_column :potential_answers, :answer, :string, :null => false
  end
end
