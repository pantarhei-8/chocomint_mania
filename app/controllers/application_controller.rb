class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    add_attrs = [ :name, :email, :password, :password_confirmation, :image, :introduction ]
    devise_parameter_sanitizer.permit :sign_up, keys: add_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: add_attrs
    devise_parameter_sanitizer.permit :account_update, keys: add_attrs
  end







end
