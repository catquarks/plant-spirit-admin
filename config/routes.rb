Rails.application.routes.draw do
	root 'application#home'

	get '/signup', to: 'registrations#new', as: 'signup'
	post '/signup', to: 'registrations#create'

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy', as: 'logout'

	get '/dashboard', to: 'users#dashboard', as: 'dashboard'

	resources :users, only: [:edit, :update]

  resources :feelings
  resources :plants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
