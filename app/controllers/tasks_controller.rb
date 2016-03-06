class TasksController < ApplicationController
	def index
		@tasks = Task.all
	end


  def new

    @task = Task.new

  end

  def create

    debugger

    #  redirect to tasks_path if current_user is not an employer
    employer = Employer.find(current_user.id)

    if !employer
      redirect_to tasks_path
    end

    # find user,  assuming they logged on as employer
    employer = current_user

    @task = Task.new(task_params)

    employer.tasks << @task

    if employer.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  protected

  # security issue, Rails has adopted a standard called "strong parameters" for mass assignment.
  def task_params
    params.require(:task).permit(:title, :description, :address, :start_date, :end_date, :duration)

  end

end
