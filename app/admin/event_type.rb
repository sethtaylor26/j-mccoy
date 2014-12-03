ActiveAdmin.register EventType do

  remove_filter :event_type_answer_weights
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :event_type_name, :parent, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form(:html => { :multipart => true }) do |f|
    f.inputs "EventType" do
      f.input :event_type_name
      f.input :parent
      f.input :image, :as => :file, :hint => f.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  show do
    attributes_table do
      row :event_type_name
      row :parent
      row :image do
          image_tag event_type.image_url(:thumb)
      end
    end 
  end

end
