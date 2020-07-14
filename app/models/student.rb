class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  devise :registerable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable
  
  # has_secure_password

  has_many :student_courses
  has_many :courses, through: :student_courses
    
end