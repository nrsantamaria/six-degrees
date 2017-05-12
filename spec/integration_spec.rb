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

describe('the delete brand from store path', {:type => :feature}) do
  it('will remove a brand from a store') do
    visit('/')
    fill_in('new_store', :with => 'nordstrom')
    click_button('Add Store')
    fill_in('new_brand', :with => 'nike')
    fill_in('new_brand_price', :with => '20')
    click_button('Add Brand')
    click_link('Nordstrom')
    click_button('Add Brand')
    click_button('x')
    expect(page).to have_content('There are no brands in the inventory yet.')
  end
end

describe('edit store path', {:type => :feature}) do
  it('update a store name') do
    visit('/')
    fill_in('new_store', :with => 'nordstrom')
    click_button('Add Store')
    click_link('Nordstrom')
    click_link('Click here to edit this store.')
    fill_in('new_store_name', :with => 'nordstrom rack')
    click_button('Update Store')
    expect(page).to have_content('Nordstrom rack')
  end
end

describe('delete store path', {:type => :feature}) do
  it('delete a store') do
    visit('/')
    fill_in('new_store', :with => 'nordstrom')
    click_button('Add Store')
    click_link('Nordstrom')
    click_link('Click here to edit this store.')
    click_button('Delete Store')
    expect(page).to have_content('There are no stores in the database yet.')
  end
end

describe('edit brand path', {:type => :feature}) do
  it('update a brand name') do
    visit('/')
    fill_in('new_brand', :with => 'nike')
    click_button('Add Brand')
    click_link('Nike')
    click_link('Click here to edit this brand.')
    fill_in('new_brand_name', :with => 'nike pro')
    click_button('Update Brand')
    expect(page).to have_content('Nike pro')
  end
end

describe('delete brand path', {:type => :feature}) do
  it('delete a brand') do
    visit('/')
    fill_in('new_brand', :with => 'nike')
    click_button('Add Brand')
    click_link('Nike')
    click_link('Click here to edit this brand.')
    click_button('Delete Brand')
    expect(page).to have_content('There are no brands in the database yet.')
  end
end
