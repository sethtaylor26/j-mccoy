ActiveAdmin.register EventTypeAnswerWeight do

  remove_filter :user_answers

  index do
    selectable_column
    column :id
    column :potential_answer
    column :event_type
    column :weight
    column :created_at
    column :updated_at
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :potential_answer_id, :event_type_id, :weight
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
