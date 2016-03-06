class EmployersController < ApplicationController
	def show
		@tasks = Task.all
	end
end
