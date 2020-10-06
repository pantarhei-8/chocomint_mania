Rails.application.routes.draw do
  get 'users/show'
  get 'users/update'
  root 'tops#index'
  get :terms_of_service, to: 'tops#terms'
end
