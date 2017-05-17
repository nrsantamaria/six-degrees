class Actor < ActiveRecord::Base
  has_and_belongs_to_many(:movies)

  def degrees (actor_id)
    first_degree = []
    second_degree = []
    third_degree = []
    first_degree_movie = nil
    second_degree_movie = nil
    third_degree_movie = nil
    first_degree_actor = nil
    second_degree_actor = nil
    third_degree_actor = nil


    self.movies.each do |movie|
      movie.actors.each do |actor|
        next if actor.id == self.id
        first_degree = [" " + actor.name]
        first_degree.unshift(" -> " + movie.title + " -> ")
        first_degree_movie = movie.id
        first_degree_actor = actor.id
        if actor.id ==(actor_id)
          return ([self.name] + first_degree).join
        else

          actor.movies.each do |movie|
            movie.actors.each do |actor|
              next if actor.id == self.id
              second_degree = [" " + actor.name]
              second_degree.unshift(" -> " + movie.title + " -> ")
              second_degree_movie = movie.id
              second_degree_actor = actor.id
              next if movie.id == first_degree_movie
              next if actor.id == first_degree_actor
              if actor.id ==(actor_id)
                return ([self.name] + ([first_degree, second_degree])).join
              else

                actor.movies.each do |movie|
                  movie.actors.each do |actor|
                    next if actor.id == self.id
                    third_degree = [" " + actor.name]
                    third_degree.unshift(" -> " + movie.title + " -> ")
                    next if actor.id == second_degree_actor || actor.id == first_degree_actor
                    next if movie.id == second_degree_movie || movie.id == first_degree_movie
                    if actor.id ==(actor_id)
                      return ([self.name] + ([first_degree, second_degree, third_degree])).join
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
