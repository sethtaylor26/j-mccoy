class MakeQuestionFieldsNotNull < ActiveRecord::Migration
  def change
    change_column :questions, :question, :text, :null => false
    change_column :questions, :question_type, :string, :null => false
  end
end
