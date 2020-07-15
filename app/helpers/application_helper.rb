module ApplicationHelper


     def session_link
     	 if logged_in?
         link_to "logout", destroy_student_session_path, :method => :delete
         else
         link_to "login", new_student_session_path
         end
     end
end
