require('spec_helper.rb')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("add a new list", {:type => :feature}) do
  it ("allows a user to create a new list") do
    visit('/')
    click_button('Make a new list')
    fill_in('name', :with => 'Shopping List')
    click_button('Submit')
    expect(page).to have_content('The list has been successfully created!')
  end
end
