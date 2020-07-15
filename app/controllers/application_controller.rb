class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	#before_action :require_user
	before_action :authenticate_student!

    helper_method :logged_in?

    alias current_user current_student
    

	def logged_in?
		!!current_student
	end

	def require_user
		if !logged_in?
			flash[:notce] = "you must be logged in to perform that action"
			redirect_to login_path
		end
	end

end
