ENV["RACK_ENV"] = "test"

require("rspec")
require("pg")
require("pry")
require("sinatra/activerecord")
require("shoulda/matchers")
require("actor")
require("movie")

RSpec.configure do |config|
  config.after(:each) do
    Movie.all.each do |movie|
      movie.destroy
    end
    Actor.all.each do |actor|
      actor.destroy
    end
  end
end
