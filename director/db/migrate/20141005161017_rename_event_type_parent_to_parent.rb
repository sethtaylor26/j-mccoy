class RenameEventTypeParentToParent < ActiveRecord::Migration
  def self.up
    rename_column :event_types, :Parent, :parent
  end

  def self.down
    rename_column :event_types, :Parent, :parent
  end
end
