Rails.application.routes.draw do

  root to: "static_pages#root"

  get "/about" => "static_pages#about"
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create]

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:update, :show]
    resources :games, except: [:new, :edit]
    resources :images, only: [:create, :update, :show]
    resources :reviews, only: [:create, :update, :destroy, :index]
  end

end
