Rails.application.routes.draw do
  
  api vendor_string: "director", default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :event_types
        resources :user_answers
        resources :events
        resources :questions
        resources :potential_answers
        resources :open_hours
        resources :recommenders
        resources :recommendation_types
        resources :event_type_answer_weights
        resources :users

        match "register" => "registrations#create", via: :post
      end
    end
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :open_hours do
    collection { post :import }
  end

  resources :user_answers

  resources :event_type_answer_weights do
    collection { post :import }
  end

  resources :potential_answers do
    collection { post :import }
  end

  resources :questions do
    collection { post :import }
  end

  resources :recommendation_types

  devise_scope :users do
    match "api/v1/session" => "api/sessions#create", via: :post
  end
  
  devise_for :users
  
  resources :events do
    collection { post :import }
  end

  resources :recommenders

  resources :event_types do
    collection { post :import }
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
