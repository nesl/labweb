Rails.application.routes.draw do
  get '/home'    => 'web_pages#show', id: 1
  get '/privacy'    => 'web_pages#show', id: 2
  get '/terms'    => 'web_pages#show', id: 3
  get '/about'    => 'web_pages#show', id: 4
  get '/interest'    => 'web_pages#show', id: 5

  devise_for :users
  resources :users

  resources :product_person_maps

  resources :document_person_maps

  resources :web_pages

  resources :grants

  resources :projects

  resources :courses

  resources :course_offerings

  resources :news_events

  resources :products

  resources :product_categories

  resources :documents

  resources :document_categories

  resources :people

  resources :person_categories

  resources :research_areas
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'web_pages#home'

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
