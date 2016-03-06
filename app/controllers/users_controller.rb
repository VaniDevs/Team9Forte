class UsersController < ApplicationController
  def show
    @badges = current_user.badges
    puts @badges
  end
end
