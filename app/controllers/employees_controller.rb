class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
  end

  def edit
    @employee = Unirest.get("http://localhost:3000/api/v2/employees/#{params[:id]}.json").body
  end

  def show
    @employee = Employee.find_by(id: params[:id])
  end

  def create
    @employee = Unirest.post('http://localhost:3000/api/v2/employees',
      headers: {"Accept" => "application/json"},
      parameters: {first_name: params[:first_name],
                   last_name: params[:last_name],
                   email: params[:email],
                   ssn: params[:ssn],
                   birthdate: params[:birthdate]
                 }
    ).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def update
    @employee = Unirest.patch('http://localhost:3000/api/v2/employees/' + params[:id],
      headers: {"Accept" => "application/json"},
      parameters: {first_name: params[:first_name],
                   last_name: params[:last_name],
                   email: params[:email],
                   ssn: params[:ssn],
                   birthdate: params[:birthdate]
                 }
    ).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    @employee.destroy
    redirect_to '/employees'
  end
end
