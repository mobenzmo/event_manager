Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      post "auth/login", to: "auth#login"
      resources :events
    end
  end
end
