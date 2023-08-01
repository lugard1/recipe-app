Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :users
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods
  end

  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
