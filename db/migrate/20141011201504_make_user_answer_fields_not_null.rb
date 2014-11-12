class MakeUserAnswerFieldsNotNull < ActiveRecord::Migration
  def change
    change_column :user_answers, :user_id, :integer, :null => false
    change_column :user_answers, :potential_answer_id, :integer, :null => false
  end
end
