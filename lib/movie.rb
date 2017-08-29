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

  def self.Load_movies
    actors_array = ["Nicolas Cage",
      "Robert De Niro",
      "Jack Nicholson",
      "Tom Hanks",
      "Tom Hardy",
      "Nicolas Cage",
      "Leonardo DiCaprio",
      "Johnny Depp",
      "Al Pacino",
      "Denzel Washington",
      "Brad Pitt",
      "Daniel Day-Lewis",
      "Tom Cruise",
      "Cary Grant",
      "Dustin Hoffman",
      "Sean Penn",
      "Christian Bale",
      "Gregory Peck",
      "Harrison Ford",
      "George Clooney"
    ]

    movie = Movie.new

    actors_array.each do |actor_name|
      movies = movie.find_movies(movie.find_actor_id(actor_name))
      actor_name2 = actor_name
      movies.each do |movie|
        if Movie.exists?(title: movie[:title])
          current_movie = Movie.find_by title: movie[:title]
        else
          new_movie = Movie.create(title: movie[:title])
          if Actor.exists?(name: actor_name2) && Movie.exists?(current_movie)
            break if Movie.count === 250
            actor = Actor.find_by name: actor_name2
            actor.movies.push(current_movie)
          else
            movie[:actors].each do |actor|
              if Actor.exists?(name: actor)
                break if Movie.count === 250
                current_actor = Actor.find_by name: actor
                new_movie.actors.push(current_actor)
              else
                break if Movie.count === 250
                new_movie.actors.push(Actor.create(name: actor))
              end
            end
          end
        end
      end
    end
  end
end
