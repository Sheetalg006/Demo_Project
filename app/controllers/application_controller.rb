class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    if resource.role == 'trainer'
      courses_path
    elsif resource.role == 'student'
      users_path
    else
      admin_dashboard_path
    end
  end
end
