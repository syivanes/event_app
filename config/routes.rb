Rails.application.routes.draw do
  resources :artists, :path => '/artists'
  resources :events, :path => '/events'
  resources :venues
end
