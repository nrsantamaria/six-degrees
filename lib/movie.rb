require 'json'
require 'rest-client'

class Movie < ActiveRecord::Base
  has_and_belongs_to_many(:actors)

  attr_accessor :name

  def initalize
    @name = name
  end

  def find_movies (actor_id)
    movie_ids = []
    found_movies = []
    response = RestClient.get"https://api.themoviedb.org/3/person/#{actor_id.to_i}/movie_credits?api_key=0431a9e2b26e9382f536559e359e0862&language=en-US"
    JSON.parse(response)['cast'].each do |cast|
      id = cast['id']
      movie_ids.push(id)
    end
    movie_ids.each do |movie_id|
      actors = []
        response1 = RestClient.get"https://api.themoviedb.org/3/movie/#{movie_id}?api_key=0431a9e2b26e9382f536559e359e0862&language=en-US"
        title = JSON.parse(response1)['title']

        response2 = RestClient.get"https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=0431a9e2b26e9382f536559e359e0862"
        JSON.parse(response2)['cast'].each do |cast|
          if cast['character'].include?("")
          actor = cast['name']
          actors.push(actor)
          end
        end

        found_movies.push({:title => title, :actors => actors})
      end
      found_movies
  end

  def find_actor_id (actor_name)
    response = RestClient.get"https://api.themoviedb.org/3/search/person?api_key=0431a9e2b26e9382f536559e359e0862&language=en-US&page=1&include_adult=false&query=#{actor_name}"
    actor_id = JSON.parse(response)['results'][0]['id']
  end

end
