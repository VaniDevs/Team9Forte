class UsersController < ApplicationController
  def index
    @users = User.all
    @userbadge = UserBadge.new
    @badges = Badge.all
  end

  def show
    @badges = current_user.badges
    puts @badges
  end
end
