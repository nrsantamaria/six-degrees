class Actor < ActiveRecord::Base
  has_and_belongs_to_many(:movies)

  def degrees (actor_id)
    self.movies.each do |movie|
      # if movie.actors.include?(actor_id)
      #   movie.title
      # else
        movie.actors.each do |actor|
          actor.movies.each do |movie|
            movie.actors.each do |actor|
            if actor.id ==(actor_id)

              return movie.title

            end
          end
        end
      end
      # return movie.title
    end
  end
end


# ('is second degree connection with' + actor.first_name + movie.title)

#
# (movie.actors.find(movie.actor_ids - [actor_id]).to_s).first_name
