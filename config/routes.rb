Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :docs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :schemas, only: [:index, :show, :new, :create, :edit, :update, :destory]
  resources :concepts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :relationships, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :properties, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :instances, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :links, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :values, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :parents, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
