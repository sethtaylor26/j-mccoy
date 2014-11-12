class AddGeneralHoursColumnsToEventModel < ActiveRecord::Migration
  def change
    add_column :events, :general_hours, :boolean
  end
end
