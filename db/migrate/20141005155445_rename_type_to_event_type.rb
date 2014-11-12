class RenameTypeToEventType < ActiveRecord::Migration
  def self.up
    rename_column :event_types, :Type, :event_type_name
  end

  def self.down
    rename_column :event_types, :Type, :event_type_name
  end
  
  
end
