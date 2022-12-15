class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:login] = "successfully logged in."
    books_path
  end

  def after_sign_out_path_for(resource)
    flash[:logout] = "successfully logged out."
    top_path
  end

  def successfully_message
    flash[:success] = "Successfully operated."
  end

  def error_message
    flash[:error] = "An error has occurred."
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end
