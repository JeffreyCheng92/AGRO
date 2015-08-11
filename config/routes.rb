Rails.application.routes.draw do

  root to: "static_pages#root"

  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create]

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:update, :show]
    resources :games
  end

end
