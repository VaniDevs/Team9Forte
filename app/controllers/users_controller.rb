class UsersController < ApplicationController
  def index
    @users = User.all
    @userbadge = UserBadge.new
    @badges = Badge.all
  end

  def show
    @badges = current_user.badges
    @earned_count = @badges.count
    @tasks_applied_count = current_user.user_tasks.where(task_type: 0).count
    @tasks_accepted_count = current_user.user_tasks.where(task_type: 1).count
    debugger
    @courses_applied_count = 0
    @courses_accepted_count = 0
    @courses_completed_count = 0

  end
end
