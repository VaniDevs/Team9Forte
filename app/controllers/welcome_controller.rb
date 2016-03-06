class WelcomeController < ApplicationController
  layout "homepage"
  skip_before_action :authenicate_override

  def index
  end

  def portal
  end
end
