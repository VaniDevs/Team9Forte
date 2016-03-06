class AgenciesController < ApplicationController
	def show
		@classes = Course.all
	end
end
