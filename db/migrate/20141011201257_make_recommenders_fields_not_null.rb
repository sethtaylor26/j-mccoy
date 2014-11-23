class MakeRecommendersFieldsNotNull < ActiveRecord::Migration
  def change
    change_column :recommenders, :first_name, :string, :null => false
    change_column :recommenders, :last_name, :string, :null => false
    change_column :recommenders, :descr, :text, :null => false
  end
end