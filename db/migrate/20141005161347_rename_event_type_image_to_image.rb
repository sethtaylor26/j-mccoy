class RenameEventTypeImageToImage < ActiveRecord::Migration
  def self.up
    rename_column :event_types, :Image, :image
  end

  def self.down
    rename_column :event_types, :Image, :image
  end
end
