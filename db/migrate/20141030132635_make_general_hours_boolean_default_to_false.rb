class MakeGeneralHoursBooleanDefaultToFalse < ActiveRecord::Migration
  def change
  	change_column :events, :general_hours, :boolean, :default => false
  end
end
