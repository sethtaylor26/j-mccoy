class MakeEventFieldsNotNull < ActiveRecord::Migration
  def change
    change_column :events, :event_type_id, :integer, :null => false
    change_column :events, :start_time, :datetime, :null => false
    change_column :events, :end_time, :datetime, :null => false
    change_column :events, :title, :string, :null => false
    change_column :events, :location_lat, :float, :null => false
    change_column :events, :location_long, :float, :null => false
    change_column :events, :spice, :integer, :null => false
    change_column :events, :cost, :integer, :null => false
  end
end
