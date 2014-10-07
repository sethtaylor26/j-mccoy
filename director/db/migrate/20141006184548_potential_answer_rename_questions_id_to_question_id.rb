class PotentialAnswerRenameQuestionsIdToQuestionId < ActiveRecord::Migration
  def self.up
    rename_column :potential_answers, :questions_id, :question_id
  end

  def self.down
    rename_column :potential_answers, :questions_id, :question_id
  end
end
