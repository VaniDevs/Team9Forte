class TasksController < ApplicationController
	before_action except: [:index, :apply] do |controller|
		controller.restrict_by_type(Employer.to_s, tasks_path)
	end

	def index
		if (user_signed_in? || agency_signed_in?)
			@tasks = Task.all
		elsif (employer_signed_in?)
			@tasks = current_employer.tasks
		end
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

    @task = Task.new(task_params)

    employer.tasks << @task

    if employer.save
      redirect_to tasks_path
    else
      render :new
    end
  end

	def edit
		@task = Task.find(id_params[:id])
	end

	def update
		@task = Task.find(id_params[:id])

		if (@task.update_attributes(task_params))
			redirect_to tasks_path, :notice  => "Successfully updated task."
		else
			redirect_to edit_task_path(@task), :error  => "#{@task.errors.full_messages.join(', ')}"
		end
	end

	def destroy

	end

	def apply
		task = Task.find(id_params[:id])

		current_user.tasks << task
		respond_to do |format|
			format.js
		end
	end

  protected

  # security issue, Rails has adopted a standard called "strong parameters" for mass assignment.
  def task_params
    params.require(:task).permit(:title, :description, :address, :start_date, :end_date, :duration)
  end

	def id_params
		params.permit(:id)
	end

end
