Rails.application.routes.draw do
  devise_for :students
  	root to: 'courses#index'
	get 'courses', to: 'courses#index'
	get 'courses/new', to: 'courses#new'
	get 'about', to: 'pages#about'
	resources :students do
	    collection do
	    get :my_courses
	    end
	end
	delete 'logout', to: 'logins#destroy'
	post 'course_enroll', to: 'student_courses#create'
end
