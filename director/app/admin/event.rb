ActiveAdmin.register Event do

  remove_filter :open_hours
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :event_type_id, :start_time, :end_time, :title, :short_review, :long_review, :web_site_url, :location_lat, :location_long, :address, :spice, :cost, :recommender_id, :image, :comments, :general_hours, :recommendation_type_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

end
