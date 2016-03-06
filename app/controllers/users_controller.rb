class UsersController < ApplicationController
  def index
    @users = User.all
    @userbadge = UserBadge.new
    @badges = Badge.all
  end

  def show
    # ><%= @earned_count %></div><p>Badges Earned</p></div>
    # <div class="col-md-2"><div class="circle-1"><%= @tasks_applied_count %></div><p>Tasks Applied</p></div>
    # <div class="col-md-2"><div class="circle-1"><%= @tasks_accepted_count %></div><p>Tasks Accepted</p></div>
    # <div class="col-md-2"><div class="circle-1"><%= @courses_applied_count %></div><p>Courses Applied</p></div>
    # <div class="col-md-2"><div class="circle-1"><%= @courses_accepted_count %></div><p>Courses Accepted</p></div>
    # <div class="col-md-2"><div class="circle-1"><%= @courses_completed_count
    @badges = current_user.badges
    @earned_count = @badges.count
    @tasks_applied_count = current_user.user_tasks.where(task_type: 0).count
    @tasks_accepted_count = current_user.user_tasks.where(task_type: 1).count
    @courses_applied_count = 0
    @courses_accepted_count = 0
    @courses_completed_count = 0

  end
end
