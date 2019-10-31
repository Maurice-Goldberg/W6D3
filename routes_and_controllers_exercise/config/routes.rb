Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :destroy, :create, :update]

  resources :artworks, only: [:show, :destroy, :create, :update]

  resources :users do
    resources :artworks, only: :index
    resources :comments, only: :index
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:index, :create, :destroy]

  resources :artworks do
    resources :comments, only: :index
  end
end