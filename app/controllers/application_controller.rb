class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    "/#{resource.class.to_s.downcase.pluralize}/#{resource.id}"
  end

  def restrict_by_type(expected_type, to_path)
    if (current_user.class.to_s != expected_type && current_employer.class.to_s != expected_type && current_agency.class.to_s != expected_type)
      redirect_to to_path, :flash => { :error => "Insufficient rights!" }
    end
  end

  def authenicate_override
    if (!user_signed_in? && !employer_signed_in? && !agency_signed_in?)
      authenticate_user!
    elsif (employer_signed_in?)
      authenticate_employer!
    elsif (agency_signed_in?)
      authenticate_agency!
    end
  end

  before_action :authenicate_override
end
