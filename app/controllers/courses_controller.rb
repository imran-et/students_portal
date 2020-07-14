class CoursesController < ApplicationController
	skip_before_action :authenticate_student!
	def index
		@courses = Course.all

	end

	def new
		
	end

	 

end