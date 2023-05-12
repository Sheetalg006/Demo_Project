class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
  enum role: [:admin, :student, :trainer]
  has_many :courses
  has_many :enrollments
  has_many :courses, through: :enrollments 

  #def check_user_role
   # if current_user.role == "student"
   #   redirect_to course_path
   # else
   #   current_user.role == "trainer"
  #    redirect_to courses_path
  # # end
end
