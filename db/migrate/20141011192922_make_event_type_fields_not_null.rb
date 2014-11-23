class MakeEventTypeFieldsNotNull < ActiveRecord::Migration
  def change
    change_column :event_types, :event_type_name, :string, :null => false
    change_column :event_types, :image, :string, :null => false
  end
end
