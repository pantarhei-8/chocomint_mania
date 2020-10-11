Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  get :terms_of_service, to: 'tops#terms'
  resources :users, only: [:index, :show, :edit, :update]
end
