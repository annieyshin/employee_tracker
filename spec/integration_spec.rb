require('spec_helper')
require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe 'adding a new employee', {:type => :feature} do
  it('allows a manager to click a list to see the employees and division information') do
    visit '/'
    click_link('Add a new employee')
    fill_in('name', :with => 'Dr. Funkhauser')
    click_button('Add')
    expect(page).to have_content('Dr. Funkhauser')
  end
end

# describe('viewing all of the list', {:type => :feature}) do
#   it('allows a user to see all of the divisions that have been created') do
#     division = Division.new({:title => 'HR', :id => nil})
#     division.save
#     visit('/')
#     click_link('View All Divisions')
#     expect(page).to have_content(division.title)
#   end
# end
#
# describe('seeing details for a single division', {:type => :feature}) do
#   it('allows a manager to click a division to see the employees and detaisl for it') do
#     test_division = Division.new({:title => "IT", :id => nil})
#     test_division.save()
#     test_employee = Employee.new({:name => "Dr. Funkhauser", :division_id => test_division.id()})
#     test_employee.save()
#     visit('/divisions')
#     click_link(test_division.title())
#     expect(page).to have_content(test_employee.name())
#   end
# end
