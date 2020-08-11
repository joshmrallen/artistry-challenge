Rails.application.routes.draw do
  resources :artists, only: [:index, :show, :new, :create, :edit, :update]
  resources :instruments, only: [:index, :show]
end
