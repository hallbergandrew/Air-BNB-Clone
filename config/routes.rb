AirbnbClone::Application.routes.draw do
  root :to => "listings#index"
  devise_for :users
  resources :users, :only => [:show]
  resources :listings
  resources :listing_photos
end
