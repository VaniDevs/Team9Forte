class ClassesController < ApplicationController
  before_action except: [:index, :apply] do |controller|
    controller.restrict_by_type(Agency.to_s, classes_path)
  end

	def index
		@classes = Course.all
	end

  def new
    @class = Course.new
    @agency = current_agency
    respond_to do |format|
      format.html
      format.js
    end
  end


  def create
    # byebug

    begin
      agency = Agency.find(params[:course][:agency_id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to classes_path, :flash => { :error => "Cannot find the agency!" } and return
    end

    @class = Course.new(class_params)

    agency.courses << @class

    if agency.save
      redirect_to classes_path
    else
      render :new
    end
  end

  def apply
		course = Course.find(id_params[:id])

		current_user.courses << course
		respond_to do |format|
			format.js
		end
	end

  protected

  # security issue, Rails has adopted a standard called "strong parameters" for mass assignment.
  def class_params
    params.require(:course).permit(:name, :description, :status, :capacity, :start_date, :end_date)
  end

  def id_params
    params.permit(:id)
  end
end
