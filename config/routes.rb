Rails.application.routes.draw do
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'

  get 'sign_up' => 'users#new', :as => 'sign_up'
  root :to => 'sessions#new'
  get 'profile', to: 'sessions#show', :as => 'profile'

  resources :users do
    resources :rsvps
  end

  resources :sessions

  resources :artists, :path => '/artists'
  resources :events, :path => '/events'
  resources :venues
end
