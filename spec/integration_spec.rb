require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
  it('has a field that will allow users to create a new store to add to the store list') do
    visit('/')
    fill_in('new_store', :with => 'nordstrom')
    click_button('Add Store')
    expect(page).to have_content('Nordstrom')
  end
end
