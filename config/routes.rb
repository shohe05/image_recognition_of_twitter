Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :tweets
  resources :users, only: [:index]
  resources :images, only: [:index, :create] do
    collection do
     get 'search_by_tag'
    end
  end
  resources :tags, only: [:index, :create]

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy"
end
