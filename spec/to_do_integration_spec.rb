require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the to-do list path", {:type => :feature}) do
  it ("displays a to-do list and allows the user to add tasks to the list") do
    visit('/')
    fill_in('description', :with => "make dinner")
    click_button('Add task')
    expect(page).to have_content("The task has been successfully submitted!")
  end
end
