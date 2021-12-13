class StudentsController < ApplicationController

  def index
    name=params[:name]
    
    if name == nil
      students = Student.all
    else
      name = name.capitalize
      students = Student.where(first_name: name).or(Student.where(last_name: name))
    end

    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
