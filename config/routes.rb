Rails.application.routes.draw do
  devise_for :views
  devise_for :users

# need to make an "import" model and set resources for it
  get 'imports/import' => 'imports#import'
  get 'imports/import_pack' => 'imports#import_pack'
  resources :gears, :events, :packs, :pack_items, :imports, :event_attendees, :wishlists

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'home' => 'home#index'  
  get 'compare' => 'pack_items#compare' 
  get 'virtual_pack' => 'virtual_packs#show' 
  # You can have the root of your site routed with "root"
  root 'home#index' 


#  get "events/form" => 'events#form', :as => :form
#  get "events/new_release" => 'events#new_release', :as => :new_release

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
