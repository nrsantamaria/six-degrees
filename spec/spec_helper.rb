ENV["RACK_ENV"] = "test"

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require("capybara/rspec")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require("./app")

Dir[File.dirname(__FILE__) + "../lib/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    ShoeStore.all.each do |store|
      store.destroy
    end
    ShoeBrand.all.each do |shoe|
      shoe.destroy
    end
  end
