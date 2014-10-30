Rails.application.routes.draw do
  get 'gemstore/show'
  get 'gemstore/products'
  root 'gemstore#show'

  namespace :apiv1 do
    resources :products, only: [:index, :create, :show, :destroy]
  end
  resources :categories, only: [:index, :show]
end
