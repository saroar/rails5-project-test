class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_location

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.has_role? :admin
      flash[:notice] = 'Sorry you are not Authorized to access this resource!'
      redirect_to root_path
    end
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if  request.path != '/users/sign_in' &&
        request.path != '/users/sign_up' &&
        request.path != '/users/password/new' &&
        request.path != '/users/password/edit' &&
        request.path != '/users/confirmation' &&
        request.path != '/users/sign_out' &&
        !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if current_user.has_role?(:admin)
        admin_dashboard_path
      else
        session[:previous_url] || root_path
      end
  end



  protected

  def configure_permitted_parameters
    added_attrs = [:avatar, :first_name, :last_name, :middle_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
