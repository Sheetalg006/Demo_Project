class EnrollmentsController < ApplicationController
  
    def index
        @enrollments = Enrollment.all
    end

    def new
        @enrollment = Enrollment.new
    end

    def create
      @enrollment = Enrollment.new(enrollment_params)
      if @enrollment.save
        redirect_to users_path, notice: 'You have enrolled Sucessfully'
      else
        render :new
      end
    end

    def display_student
      @enrollment = Enrolment.find(params[:id])
    end


    private
    def enrollment_params
      params.require(:enrollment).permit(:user_id,:course_id)
    end

end