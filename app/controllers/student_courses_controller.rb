class StudentCoursesController < ApplicationController

	def create
		course_to_add = Course.find(params[:course_id])
		unless current_student.courses.include?(course_to_add)
			StudentCourse.create(course: course_to_add, student: current_student)
			flash[:notice] = "you have successfully enroll in #{course_to_add.name}"
			redirect_to current_student


		else
			flash[:notice] = "something went wrong with your enrollments"
			redirect_to root_path

		end
	end
end