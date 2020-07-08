Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :docs, only: [:index, :show, :new, :create, :edit, :update]
  resources :schemas, only: [:index, :show, :new, :create, :edit, :update]
  resources :concepts, only: [:index, :show, :new, :create, :edit, :update]
  resources :relationships, only: [:index, :show, :new, :create, :edit, :update]
  resources :properties, only: [:index, :show, :new, :create, :edit, :update]
  resources :instances, only: [:index, :show, :new, :create, :edit, :update]
  resources :links, only: [:index, :show, :new, :create, :edit, :update]
  resources :values, only: [:index, :show, :new, :create, :edit, :update]
  resources :parents, only: [:index, :show, :new, :create, :edit, :update]
end
