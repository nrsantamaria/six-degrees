class Actor < ActiveRecord::Base
  has_and_belongs_to_many(:movies)

  def degrees (actor_id)
    first_degree = []
    second_degree = []
    third_degree = []


    self.movies.each do |movie|
      movie.actors.each do |actor|
        next if actor.id == self.id
        first_degree = [actor.first_name]
        first_degree.unshift(movie.title)
        if actor.id ==(actor_id)
          return results = ([self.first_name] + first_degree)
        end

        actor.movies.each do |movie|
          movie.actors.each do |actor|
            next if actor.id == self.id
            second_degree = [actor.first_name]
            second_degree.unshift(movie.title)
            if actor.id ==(actor_id)
              return results = ([self.first_name] + (first_degree + second_degree))
            end

            actor.movies.each do |movie|
              movie.actors.each do |actor|
                next if actor.id == self.id
                third_degree = [actor.first_name]
                third_degree.unshift(movie.title)
                if actor.id ==(actor_id)
                  return results = ([self.first_name] + (first_degree + second_degree + third_degree)).uniq
                end
              end
            end
          end
        end
      end
    end
  end
end
