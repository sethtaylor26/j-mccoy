ActiveAdmin.register PotentialAnswer do

  remove_filter :user_answers
  remove_filter :event_type_answer_weights


  index do
    selectable_column
    column :id
    column :question
    column :answer
    column :created_at
    column :updated_at
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :question_id, :answer
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
