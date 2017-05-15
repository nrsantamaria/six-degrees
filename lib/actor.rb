class Actor < ActiveRecord::Base
  has_and_belongs_to_many(:movies)

  def degrees (actor_id)

    actors_array = []
    movies_array = []

    self.movies.each do |movie|
      movie.actors.each do |actor|
        if actors_array.any?
          movies_array.push(movie.title)
        end
        actor.movies.each do |movie|
          actors_array.push(actor.first_name)
          movie.actors.each do |actor|
            if actors_array.any?
              movies_array.push(movie.title)
            end
            actor.movies.each do |movie|
              actors_array.push(actor.first_name)
              movie.actors.each do |actor|
                if actor.id ==(actor_id)
                  return movies_array.push(movie.title).uniq + actors_array.uniq
                end
              end
            end
          end
        end
      end
    end
  end
end
