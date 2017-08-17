Rails.application.routes.draw do
	resources :users
	resources :attractions
	resources :rides
	root to: 'home#welcome'
	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'

end