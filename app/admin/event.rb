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
      f.input :start_time, :as => :datetime_picker
      f.input :end_time, :as => :datetime_picker
      f.input :title
      f.input :short_review
      f.input :long_review
      f.input :web_site_url
      f.input :location_lat
      f.input :location_long
      f.input :address
      f.input :spice
      f.input :cost
      if f.object.image?
        f.input :image, :as => :file, :hint => f.image_tag(f.object.image.url(:thumb))
      else
        f.input :image, :as => :file, :hint => f.image_tag(f.object.event_type.image.url(:thumb))
      end
      f.input :comments
    end
    f.actions
  end

  show do
    attributes_table do
      row :event_type
      row :general_hours
      row :recommender
      row :recommendation_type
      row :start_time, :as => :datetime_picker
      row :end_time, :as => :datetime_picker
      row :title
      row :short_review
      row :long_review
      row :web_site_url
      row :location_lat
      row :location_long
      row :address
      row :spice
      row :cost
      row :image do
        if event.image?
          image_tag event.image_url(:thumb)
        else
          image_tag event.event_type.image_url(:thumb)
        end
      end
      row :comments
    end 
  end

end
