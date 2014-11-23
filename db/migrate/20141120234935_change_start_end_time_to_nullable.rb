class ChangeStartEndTimeToNullable < ActiveRecord::Migration
  def change
  	change_column_null :events, :start_time, true
  	change_column_null :events, :end_time, true
  end
end
