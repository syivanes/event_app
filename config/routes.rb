Rails.application.routes.draw do
  resources :venue_suggestions
  resources :artists, :path => '/artists'
  resources :events, :path => '/events'
  resources :venues
end
