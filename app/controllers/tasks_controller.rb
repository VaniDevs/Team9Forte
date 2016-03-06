class TasksController < ApplicationController
	before_action { |controller| controller.restrict_by_type(Employer.to_s)}, except: [:index]

	def index
		@tasks = Task.all
	end


  def new
    @task = Task.new
  end

  def create
    #  redirect to tasks_path if current_user is not an employer
    employer = Employer.find(email: current_user.email)

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
