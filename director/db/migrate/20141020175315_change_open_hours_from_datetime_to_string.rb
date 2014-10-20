class ChangeOpenHoursFromDatetimeToString < ActiveRecord::Migration
  def up
  	change_column :open_hours, :open_hour, :string, :limit => 5
  	change_column :open_hours, :close_hour, :string, :limit => 5
  end

  def down
  	change_column :open_hours, :open_hour, :time
  	change_column :open_hours, :close_hour, :time 
  end
end
