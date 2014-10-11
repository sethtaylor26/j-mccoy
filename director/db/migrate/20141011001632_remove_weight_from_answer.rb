class RemoveWeightFromAnswer < ActiveRecord::Migration
  def change
    remove_column :potential_answers, :answer_weight
  end
end
