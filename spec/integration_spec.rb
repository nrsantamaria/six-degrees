require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add store path', {:type => :feature}) do
  it('has a field that will allow users to create a new store to add to the store list') do
    visit('/')
    fill_in('new_store', :with => 'nordstrom')
    click_button('Add Store')
    expect(page).to have_content('Nordstrom')
  end
end

describe('the store path', {:type => :feature}) do
  it('will have a seperate page for stores') do
    visit('/')
    fill_in('new_store', :with => 'nordstrom')
    click_button('Add Store')
    click_link('Nordstrom')
    expect(page).to have_content('There are no brands in the inventory yet.')
  end
end

describe('the add brand path', {:type => :feature}) do
  it('has a field that will allow users to create a new brand to add to the brand list') do
    visit('/')
    fill_in('new_brand', :with => 'nike')
    fill_in('new_brand_price', :with => '20')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end
end

describe('the add brand to store path', {:type => :feature}) do
  it('will add brands to a store') do
    visit('/')
    fill_in('new_store', :with => 'nordstrom')
    click_button('Add Store')
    fill_in('new_brand', :with => 'nike')
    fill_in('new_brand_price', :with => '20')
    click_button('Add Brand')
    click_link('Nordstrom')
    click_button('Add Brand')
    expect(page).to have_content('Click on brand names to learn more:')
  end
end
