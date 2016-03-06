class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    "/users/#{current_user.id}"
  end

  def restrict_by_type(expected_type)
    if (current_user.class.to_s != expected_type)
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
    end
  end

  before_action :authenticate_user!
end
