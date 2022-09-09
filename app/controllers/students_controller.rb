class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students
  end

  def grades
    students = Student.all
    grade_array = []
    students.each do |student|
      if grade_array.length == 0
        grade_array << student
      elsif grade_array[0].grade < student.grade
        grade_array.unshift(student)
      else 
        grade_array << student
      end
    end
    render json: grade_array
  end

end
