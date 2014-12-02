class AddQuestionIdToUserAnswer < ActiveRecord::Migration
  def up
    add_column :user_answers, :question_id, :integer

    UserAnswer.find_each do |answer|

      potential_answer = PotentialAnswer.find(answer.potential_answer_id)
    	answer.question_id = potential_answer.question_id
    	answer.save!
    end

    change_column :user_answers, :question_id, :integer, :null => false

  end


  def down
  	remove_column :user_answers, :question_id
  end
end
