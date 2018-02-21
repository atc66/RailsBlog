Rails.application.routes.draw do

get '/users', to: "users#index"
post 'users', to: "user#create"
		
	root to: "blogs#index"
	resources :blogs
end
