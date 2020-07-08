Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :docs, only: [:index, :show, :new, :create, :update]
  resources :schemas, only: [:index, :show, :new, :create, :update]
  resources :concepts, only: [:index, :show, :new, :create, :update]
  resources :relationships, only: [:index, :show, :new, :create, :update]
  resources :properties, only: [:index, :show, :new, :create, :update]
  resources :instances, only: [:index, :show, :new, :create, :update]
  resources :links, only: [:index, :show, :new, :create, :update]
  resources :values, only: [:index, :show, :new, :create, :update]
end
