Rails.application.routes.draw do
  root "dashboard#main"
  get 'dashboard/main'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :clients
  resources :proposals
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
