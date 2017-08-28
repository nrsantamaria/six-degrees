ENV["RACK_ENV"] = "test"

require("rspec")
require("pg")
require("sinatra/activerecord")
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
