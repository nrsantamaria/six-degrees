require("spec_helper")
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

describe('the movies page', {:type => :feature}) do
  it('has a content') do
    visit('/movies')
    expect(page).to have_content('Current movies included in database')
  end
end

describe('the a individual movies page', {:type => :feature}) do
  it('has a content') do
    actor1 = Actor.create({:name => "nic cage"})
    actor2 = Actor.create({:name => "steve buscemi"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    visit('/movies')
    click_on movie1.title
    expect(page).to have_content('Movie Title')
  end
end

describe('six degrees path', {:type => :feature}) do
  it('will show the seperation') do
    actor1 = Actor.create({:name => "nic cage"})
    actor2 = Actor.create({:name => "steve buscemi"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    visit('/')
    fill_in('Enter A Name For The First Actor:', :with => actor1.name )
    fill_in('Enter A Name For The Second Actor:', :with => actor2.name )
    click_button('See Degrees')
    expect(page).to have_content('Actor Connection')
  end
end
describe('six degrees path for errors', {:type => :feature}) do
  it('will show the seperation') do
    visit('/')
    fill_in('Enter A Name For The First Actor:', :with => ' ')
    fill_in('Enter A Name For The Second Actor:', :with => ' ')
    click_button('See Degrees')
    expect(page).to have_content('Oops')
  end
end
