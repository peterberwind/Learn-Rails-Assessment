Rails.application.routes.draw do
  resources :clients
  resources :proposals
  root "projects#index"
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
