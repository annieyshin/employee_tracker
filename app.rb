ENV['RACK_ENV'] = 'test'
require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/employee')
require('./lib/division')
require("pg")
require("pry")

get("/") do
  @employees = Employee.all
  erb(:index)
end

get("/employee/new") do
  erb(:employee_form)
end

post('/employee/new') do
  name = params["name"]
  Employee.create({:name => name})
  redirect '/'
end

get("/division") do
  @divisions = Division.all()
  erb(:division)
end

post("/division") do
  title = params["title"]
  Division.create({:title => title})
  @divisions = Division.all()
  erb(:division)
end

get("/employee_assign") do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:employee_assign)
end

post("/employee_assign") do
  division_id = params["divisions_drop"].to_i
  employee_id = params["employees_drop"].to_i
  employee_lookup = Employee.find_by(id: employee_id)
  employee_lookup.update(division_id: division_id)
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:employee_assign)
end
