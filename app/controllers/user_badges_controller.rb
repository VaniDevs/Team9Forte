class UserBadgesController < ApplicationController
  def create
    #  redirect to tasks_path if current_user is not an employer

    # begin
    #   employer = Employer.find(email: current_user.email)
    # rescue ActiveRecord::RecordNotFound => e
    #   redirect_to tasks_path, :flash => { :error => "Cannot find the employer!" } and return
    # end

    userbadge = UserBadge.new(userbadge_params)

    # employer.tasks << @task

    if userbadge.save
      redirect_to users_path
    # else
    #   render :new
    end
  end

  protected

  # security issue, Rails has adopted a standard called "strong parameters" for mass assignment.
  def userbadge_params
    params.require(:user_badge).permit(:badge_id, :user_id)

  end
end
