ENV["RACK_ENV"] = "test"

require("rspec")
require("pg")
require("pry")
require("sinatra/activerecord")
require("shoulda/matchers")
require("brand")
require("store")

RSpec.configure do |config|
  config.after(:each) do
    Store.all.each do |store|
      store.destroy
    end
    Brand.all.each do |shoe|
      shoe.destroy
    end
  end
end
