class TasksController < ApplicationController
	before_action except: [:index] do |controller|
		controller.restrict_by_type(Employer.to_s, tasks_path)
	end

	def index
		@tasks = Task.all
	end


  def new
    @task = Task.new
		respond_to do |format|
			format.html
			format.js
		end
  end

  def create
		begin
    	employer = Employer.find_by(email: current_employer.email)
    rescue ActiveRecord::RecordNotFound => e
      redirect_to tasks_path, :flash => { :error => "Cannot find the employer!" } and return
    end

		debugger

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
