Ratebeer::Application.routes.draw do
  resources :beers


  resources :breweries
	root :to => 'breweries#index'
	#get 'ratings', to: 'ratings#index'
 	get 'kaikki_bisset', to: 'beers#index'
 	#get 'ratings/new', to:'ratings#new'
 	#post 'ratings', to: 'ratings#create'
 	resources :ratings, :only => [:index, :new, :create, :destroy]
end
