class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  private

  def require_login
    unless current_user
      flash[:notice] = "You must be signed in to perform this action."
      redirect_to root_path
    end
  end


  protected

  def configure_permitted_parameters
    added_attrs = [:name, :username, :email, :password, :password_confirmation, :department_id, :professor, :department_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end