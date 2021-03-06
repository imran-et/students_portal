class LoginsController < ApplicationController

	before_action :authenticate_student!, only: [:new, :create]
	
	def new
	end

	def create
		student = Student.find_by(email: params[:logins][:email].downcase)
		if student && student.authenticate(params[:logins][:password])
			session[:student_id] = student.id
			flash[:notice] = "you have successfully logged in"
			redirect_to student

		else
			flash[:notice] = "something was wrong with your login information"
			render 'new'
		end

	end

	def destroy
		session[:student_id] = nil
		flash[:notice] = "you have successfully logged out"
		redirect_to courses_path

	end


end