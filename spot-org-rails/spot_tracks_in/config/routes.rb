Rails.application.routes.draw do
  root to: 'spot_tracks#index'
  resources :spot_tracks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
