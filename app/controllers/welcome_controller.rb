class WelcomeController < ApplicationController
  skip_before_action :authenicate_override
  before_action :signed_in

  def index
  end

  def portal
  end
end
