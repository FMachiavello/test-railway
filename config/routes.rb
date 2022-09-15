# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root controller: :home, action: :index

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'users/auth'
    resources :dishes
    resources :orders
    resources :menus, only: %i[index show]
  end
end
