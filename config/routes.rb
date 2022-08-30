# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipes
  resources :pages
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  delete 'recipes/:id/delete' => 'recipes#destroy', as: 'recipes_delete'
  get '/recipes/:id/delete' => 'recipes#destroy'
  # Defines the root path route ("/")
  root "pages#index"
end
