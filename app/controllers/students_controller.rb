class StudentsController < ApplicationController
  # skip_before_action :authenticate_student!, only: [:new, :create]
	before_action :set_student, only: [:show, :edit, :update]
  before_action :require_same_student, only: [:edit, :update]

 def index
 	@students = Student.all

 end

 def show

 end

  def my_courses
    @courses = current_student.courses
  end


 def new
 	@student = Student.new

 end

 def create
 	@student = Student.new(student_params)
 	if @student.save
 		flash[:notice] = "you have successfully signed up"
 		redirect_to @student

 	else
 		render 'new'
 	end

 end


    def edit

    end

    def update
    	if @student.update(student_params)
           flash[:notice] = "you have successfully updated your profile"
          sign_in @student, bypass: true
            redirect_to (@student)
    	else
    		render 'edit'
    	end
    end


   private

    def set_student
    	@student = Student.find(params[:id])
    end


    def student_params
    	params.require(:student).permit(:name, :email, :password, :password_confirmation )
    end
     
     def require_same_student
        if current_user != @student
        flash[:notice] = "you can only edit your own profile"
        redirect_to student_path(current_student)
     end
     end





end