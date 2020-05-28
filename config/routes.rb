Rails.application.routes.draw do

	devise_for :users, 
	:controllers=>{ :registrations=>"users/registrations"} 
	resources :cart_items
	resources :categories do
		resources :products
	end
	get :shopping_cart, to: 'users#show_cart'
	resources :orders
	resources :order_items
	root 'pages#login'

	 # authenticated :user do
  #   root to: 'pages#login', as: :authenticated_user_root
  # end

  # authenticated :admin do
  #   root to: 'admin/dashboards#index', as: :authenticated_admin_root
  # end

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
