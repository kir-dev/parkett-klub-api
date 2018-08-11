Rails.application.routes.draw do
  resources :parties
  resources :workshops
  resources :dance_teachers
  resources :djs
  resources :dances
  resources :articles
  resources :users
  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
