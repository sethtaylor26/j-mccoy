class RenameRecommenderDescToDescr < ActiveRecord::Migration
  def change
    rename_column :recommenders, :desc, :descr
  end
end