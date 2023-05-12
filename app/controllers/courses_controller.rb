class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: "Course has been created sucessfully"
    else
      render :new, status: :unprocessable_entity  
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if 
      @course.update(course_params)
      redirect_to courses_path, notice: "Courses has been updated sucessfully" 
    else
      render :edit
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to courses_path, notice: "Courses has been deleted sucessfully" 
    end 
  end

  private
  
  def course_params
    params.require(:course).permit(:title, :description, :price,:user_id)
  end
end