class ClassesController < ApplicationController
	def index
		@classes = Course.all
	end
end
