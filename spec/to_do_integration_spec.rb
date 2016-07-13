require('spec_helper.rb')
require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("add a new list", {:type => :feature}) do
  it ("allows a user to create a new list") do
    visit('/')
    click_link('Make a new list')
    fill_in('list_name', :with => 'Shopping List')
    click_button('Submit')
    expect(page).to have_content('The list has been successfully created!')
  end
end

describe("view all to-do lists", {:type => :feature}) do
  it ("allows a user to click on a link to see all their to-do lists") do
    visit('/')
    click_link('Make a new list')
    fill_in('list_name', :with => 'Shopping List')
    click_button('Submit')
    expect(page).to have_content('The list has been successfully created!')
    click_link('Your Lists')
    expect(page).to have_content('Shopping List')
  end
end
