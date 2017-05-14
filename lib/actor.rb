class Actor < ActiveRecord::Base
  has_and_belongs_to_many(:movies)

  define_method(:degrees) do
    if actor.movie_id == actor.movie_id
      actor.movies
    end
  end
end
