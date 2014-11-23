ActiveAdmin.register Event do

  remove_filter :open_hours
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :event_type_id, :general_hours, :recommender_id, :recommendation_type_id, :start_time, :end_time, :title, :short_review, :long_review, :web_site_url, :location_lat, :location_long, :address, :spice, :cost, :image, :comments
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    selectable_column
    column :title
    column :event_type
    column :general_hours
    column :start_time
    column :end_time
    column :short_review
    column :spice
    column :cost
    column :recommender
    column :recommendation_type
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Event" do
      f.input :event_type
      f.input :general_hours
      f.input :recommender
      f.input :recommendation_type
      f.input :start_time
      f.input :end_time
      f.input :title
      f.input :short_review
      f.input :long_review
      f.input :web_site_url
      f.input :location_lat
      f.input :location_long
      f.input :address
      f.input :spice
      f.input :cost
      f.input :image, :as => :file
      f.input :comments
    end
    f.actions
  end

end
