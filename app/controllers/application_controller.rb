class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def configurepermittedparameters 
  	deviseparametersanitizer.for(:sign_up) << :handle
    # Add for edit update
    devise_parameter_sanitizer.for(:account_update) << :fullname
    devise_parameter_sanitizer.for(:account_update) << :handle
    devise_parameter_sanitizer.for(:account_update) << :url
    devise_parameter_sanitizer.for(:account_update) << :location
    devise_parameter_sanitizer.for(:account_update) << :bio
end
end
