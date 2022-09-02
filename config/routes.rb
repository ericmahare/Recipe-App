# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipes do
    resources :recipe_foods, only: [:create, :new, :edit, :update, :destroy]
  end

  resources :public_recipes
  devise_for :users
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  delete 'recipes/:id/delete' => 'recipes#destroy', as: 'recipes_delete'
  get '/recipes/:id/delete' => 'recipes#destroy'
  delete '/recipes/:recipe_id/recipe_foods/:id/delete' => 'recipe_foods#destroy', as: 'recipe_foods_delete'
  get '/recipes/:recipe_id/recipe_foods/:id/delete' => 'recipe_foods#destroy'
  # patch '/recipes/:id', to: 'recipes#mark_as_public', as: :update_recipe

  # Defines the root path route ("/")
  root "public_recipes#index"
end
