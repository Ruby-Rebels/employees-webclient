class Employee
  attr_accessor :first_name, :last_name, :email, :birthdate, :ssn, :id

  def initialize(input)
    @id = input["id"]
    @first_name = input["first_name"]
    @last_name = input["last_name"]
    @email = input["email"]
    @birthdate = input["birthdate"]
    @ssn = input["ssn"]
  end

  def self.all
    api_employees = Unirest.get('http://localhost:3000/api/v2/employees.json').body
    employees = []
    api_employees.each do |api_employee|
      employees << Employee.new(api_employee)
    end
    employees
  end

  def self.find_by(options)
    employee_hash = Unirest.get("http://localhost:3000/api/v2/employees/#{options[:id]}.json").body
    Employee.new(employee_hash)
  end

  def destroy
    Unirest.delete('http://localhost:3000/api/v2/employees/' + id.to_s,
        headers: {"Accept" => "application/json"}
      ).body
  end
end
