Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :companies
  root 'vist#index'

  resources :jobs
  resources :admin
  get "admin/company/:id", to: "companies#edit"
end
