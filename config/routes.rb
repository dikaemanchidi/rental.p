Rails.application.routes.draw do
  root 'rentals#index'
  resources :rentals do
    resources :depots
  end
end
