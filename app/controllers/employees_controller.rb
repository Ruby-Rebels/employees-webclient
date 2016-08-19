class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get('http://localhost:3000/api/v2/employees.json').body
  end

  def new
  end

  def edit
    @employee = Unirest.get("http://localhost:3000/api/v2/employees/#{params[:id]}.json").body
  end

  def show
    @employee = Unirest.get("http://localhost:3000/api/v2/employees/#{params[:id]}.json").body
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
    @employee = Unirest.delete('http://localhost:3000/api/v2/employees/' + params[:id],
        headers: {"Accept" => "application/json"}
      ).body
    redirect_to '/employees'
  end
end
