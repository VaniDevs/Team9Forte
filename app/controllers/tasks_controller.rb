class TasksController < ApplicationController
	before_action except: [:index] do |controller|
		controller.restrict_by_type(Employer.to_s, tasks_path)
	end

	def index
		@tasks = Task.all
	end


  def new
    @task = Task.new
  end

  def create
    #  redirect to tasks_path if current_user is not an employer
		begin
    	employer = Employer.find(email: current_user.email)
    rescue ActiveRecord::RecordNotFound => e
      redirect_to tasks_path, :flash => { :error => "Cannot find the employer!" } and return
    end

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
