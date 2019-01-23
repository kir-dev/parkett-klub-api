Rails.application.routes.draw do

  get '/users/me', to: 'users#me'
  get '/auth/authsch', to: 'authentication#authsch', format: false

  resources :parties
  resources :workshops
  resources :dance_teachers
  resources :djs
  resources :dances
  resources :articles
  resources :users, :except => [:new]
  resources :members
  resources :dance_types
  resources :bands

end
