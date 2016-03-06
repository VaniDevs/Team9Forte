class WelcomeController < ApplicationController
  skip_before_action :authenicate_override

  def index
  end
end
