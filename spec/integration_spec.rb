require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home page', {:type => :feature}) do
  it('has a content') do
    visit('/')
    expect(page).to have_content('Six Degrees')
  end
end

describe('six degrees path', {:type => :feature}) do
  it('will show the seperation') do
    visit('/')
    fill_in('Enter A Name For The First Actor:', :with => 'Adam Sandler')
    fill_in('Enter A Name For The Second Actor:', :with => 'Will Ferrell')
    click_button('See Degrees')
    expect(page).to have_content('Actor Connection')
  end
end
# describe('six degrees path for errors', {:type => :feature}) do
#   it('will show the seperation') do
#     visit('/')
#     fill_in('Enter A Name For The First Actor:', :with => ' ')
#     fill_in('Enter A Name For The Second Actor:', :with => ' ')
#     click_button('See Degrees')
#     expect(page).to have_content('Oops')
#   end
# end
