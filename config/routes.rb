Rails.application.routes.draw do
  root to: 'welcome#index'

  post '/signup', :to=>'welcome#create', :as=>'signups'
  get '/my_team', :to=>'teams#my_team'
  get '/play_match', :to=>'matches#play_match'
  get '/admin' => 'admin#index', :as => 'admin'
  put '/admin/grant/:id' => 'admin#grant', :as =>'admin_grant'
  devise_for :users

  resources :match_events
  resources :matches
  resources :tactics
  resources :stadia
  resources :positions
  resources :players
  resources :teams

  namespace :admin do
    resources :double_yellow_card_descriptions
    resources :yellow_card_descriptions
    resources :red_card_descriptions
    resources :injury_descriptions
    resources :goal_descriptions
    resources :solo_goal_descriptions
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
