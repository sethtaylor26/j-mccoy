ActiveAdmin.register OpenHour do

  index do
    selectable_column
    column :id
    column :event
    column :day_of_the_week
    column :open_hour
    column :close_hour
    column :created_at
    column :updated_at
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :event_id, :day_of_the_week, :open_hour, :close_hour
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
