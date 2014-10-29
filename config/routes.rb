Rails.application.routes.draw do
  get 'gemstore/show'
  root 'gemstore#show'
end
