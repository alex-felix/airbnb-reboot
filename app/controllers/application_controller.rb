class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
end
