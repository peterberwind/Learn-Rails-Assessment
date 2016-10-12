Rails.application.routes.draw do
  get 'dashboard/main'
  devise_for :users
  resources :clients
  resources :proposals
  resources :projects
  root "dashboard#main"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
