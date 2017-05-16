require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/actor')
require('./lib/movie')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

get("/") do
  @movies = Movie.all()
  @actors = Actor.all()
  erb(:index)
end

post("/degrees") do
  @movies = Movie.all()
  @actors = Actor.all()
  @actor = Actor.find(params.fetch("id").to_i)
  actor_two = Actor.find(params.fetch("actor_id").to_i)
  @degrees = @actor.degrees(actor_two.id)
  erb(:degrees)
end
get("/degrees") do
  @movies = Movie.all()
  @actors = Actor.all()
  erb(:degrees)
end
post("/movies") do
  title = params.fetch("new_movie")
  @movie = Movie.create({:title => title})
  redirect("/")
end

post("/actors") do
  first_name = params.fetch("actor_first")
  last_name = params.fetch("actor_last")
  @actor = Actor.create({:first_name => first_name, :last_name => last_name})
  redirect("/")
end

get("/movies/:id") do
  @movie = Movie.find(params.fetch("id").to_i)
  @actors = Actor.all()
  erb(:movie)
end

post("/movies/:id/actors") do
  @movie = Movie.find(params.fetch("id").to_i)
  actor_id = params.fetch("actor_id").to_i
  @actor = Actor.find(actor_id)
  @actor.movies.push(@movie)
  redirect("/movies/#{@movie.id}")
end

delete("/movies/:movie_id/actors/:actor_id/delete_actor") do
  movie_id = params.fetch("movie_id").to_i
  actor_id = params.fetch("actor_id").to_i
  @movie = Movie.find(movie_id)
  @actor = Actor.find(actor_id)
  @movie.actors.destroy(@actor)
  redirect("/movies/#{@movie.id}")
end

get("/actors/:id") do
  @actor = Actor.find(params.fetch("id").to_i)
  erb(:actor)
end

get("/movie_edit/:id") do
  @movie = Movie.find_by(id: params.fetch("id").to_i)
  erb(:movie_edit)
end

patch("/movie_edit/:id") do
  movie_id = params.fetch("id").to_i
  title = params.fetch("new_movie_title")
  @movie = Movie.find(params.fetch("id").to_i)
  @movie.update({:title => title})
  redirect("/movies/#{movie_id}")
end

delete("/movie_delete/:id") do
  movie_id = params.fetch("id").to_i
  @movie = Movie.find(params.fetch("id").to_i)
  @movie.delete
  redirect("/")
end

get("/actor_edit/:id") do
  @actor = Actor.find_by(id: params.fetch("id").to_i)
  erb(:actor_edit)
end

patch("/actor_edit/:id") do
  actor_id = params.fetch("id").to_i
  first_name = params.fetch("new_actor_first")
  last_name = params.fetch("new_actor_last")
  @actor = Actor.find(params.fetch("id").to_i)
  @actor.update({:first_name => first_name, :last_name => last_name})
  redirect("/actors/#{actor_id}")
end

delete("/actor_delete/:id") do
  actor_id = params.fetch("id").to_i
  @actor = Actor.find(params.fetch("id").to_i)
  @actor.delete
  redirect("/")
end
