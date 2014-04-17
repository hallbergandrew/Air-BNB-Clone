AirbnbClone::Application.routes.draw do
  root :to => "listings#index"
  devise_for :users
  resources :users, :only => [:show]
  resources :listings do
    resources :listing_photos
  end
  resources :listing_photos

  resources :charges
end
