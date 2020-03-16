Rails.application.routes.draw do


	resources :categories do
		resources :products
	end

root 'pages#login'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end