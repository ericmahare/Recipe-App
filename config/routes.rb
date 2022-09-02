# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipes do
    resources :recipe_foods, only: [:create, :new, :edit, :update, :destroy]
  end

  resources :public_recipes
  devise_for :users
  resources :foods
  
  get '/shoppingList_list/:recipe_id', to: 'recipe_foods#shopping_list', as: :shoppingList_list
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  delete 'recipes/:id/delete' => 'recipes#destroy', as: 'recipes_delete'
  get '/recipes/:id/delete' => 'recipes#destroy'

  # Defines the root path route ("/")
  root "public_recipes#index"
end
