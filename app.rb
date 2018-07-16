ENV['RACK_ENV'] = 'test'
require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/employee')
require('./lib/division')
require("pg")

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
  @divisions = Division.all
  erb(:division)
end

post("/division") do

  erb(:division)
end
