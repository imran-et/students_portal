class Course < ApplicationRecord
      validates :name, presence: true
      validates :short_name, presence: true
      validates :description, presence: true

      has_many :student_courses
      has_many :students, through: :student_courses
end