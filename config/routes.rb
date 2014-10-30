Rails.application.routes.draw do
  get 'gemstore/show'
  root 'gemstore#show'

  resources :products, only: [:index, :create, :show, :destroy]
end
