
class Actor < ActiveRecord::Base
  has_and_belongs_to_many(:movies)

 def degrees (actor_id)

   first_degree_movie = nil
    first_degree_actor = nil

   second_degree_movie = nil
    second_degree_actor = nil

   third_degree_movie = nil
    third_degree_actor = nil


   self.movies.each do |movie|
      movie.actors.each do |actor|
        next if actor.id == self.id
        first_degree_movie = movie.title
        first_degree_actor = actor.name
        if actor.id == (actor_id)
          return self.name + "<br>" + "<span class='sm_text'> was in </span>" + "<br>" + '"' + first_degree_movie + '"' + "<br>" + "<span class='sm_text'> with </span>" + "<br>" + first_degree_actor
        else

         actor.movies.each do |movie|
            movie.actors.each do |actor|
              next if actor.id == self.id || movie.title == first_degree_movie || actor.name == first_degree_actor
              second_degree_movie = movie.title
              second_degree_actor = actor.name
              if actor.id == (actor_id)
                return self.name + "<br>" + "<span class='sm_text'> was in </span>" + "<br>" + '"' + first_degree_movie + '"' + "<br>" + "<span class='sm_text'> with </span>" + "<br>" + first_degree_actor + "<br>" + "<span class='sm_text'> who was in </span>" + "<br>"+ '"' + second_degree_movie + '"' + "<br>" + "<span class='sm_text'> with </span>" + "<br>" + second_degree_actor
              else

               actor.movies.each do |movie|
                  movie.actors.each do |actor|
                    next if actor.id == self.id || actor.name == second_degree_actor || actor.name == first_degree_actor || movie.title == second_degree_movie || movie.title == first_degree_movie
                    third_degree_movie = movie.title
                    third_degree_actor = actor.name
                    if actor.id == (actor_id)
                      return self.name + "<br>" + "<span class='sm_text'> was in </span>" + "<br>" + '"' + first_degree_movie + '"' + "<br>" + "<span class='sm_text'> with </span>" + "<br>" + first_degree_actor + "<br>" + "<span class='sm_text'> who was in </span>" + "<br>"+ '"' + second_degree_movie + '"' + "<br>" + "<span class='sm_text'> with </span>" + "<br>" + second_degree_actor + "<br>" + "<span class='sm_text'> who was in </span>" + "<br>" + '"' + third_degree_movie + '"' + "<br>" + "<span class='sm_text'> with </span>" + "<br>" + third_degree_actor
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
