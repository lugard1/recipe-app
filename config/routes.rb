Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :users
  resources :foods, only: %i[index new create destroy]
  resources :recipees, only: %i[index show new create destroy] do
    resources :recipe_foods, only: %i[new create destroy] 
  end

  resources :public_recipees, only: [:index]
  resources :general_shopping_list, only: [:index]
end
