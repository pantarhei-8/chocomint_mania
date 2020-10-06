Rails.application.routes.draw do
  root 'tops#index'
  get :terms_of_service, to: 'tops#terms'
end
