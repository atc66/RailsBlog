Rails.application.routes.draw do

	get '/users', to: "users#index"
	get 'users/new'
	post 'users', to: "users#create"
	get 'users/show'
		
	root to: "sessions#new"
	
	resources :blogs do
		resources :comments
	end

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	post'/logout', to: 'sessions#destroy'

	get '/blogs/:blog_id/comments/new', to: "comments#new"
	post '/blogs/:blog_id/comments/new', to: "comments#create"
	
end
