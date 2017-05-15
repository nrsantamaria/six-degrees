class Actor < ActiveRecord::Base
  has_and_belongs_to_many(:movies)

  def degrees (actor_id)
    self.movies.each do |movie|
      movie.actors.include?(actor_id)
      return movie.title
    end
  end
end
