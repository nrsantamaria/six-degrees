require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('pg')
require('pry')
require('./lib/actor')
require('./lib/movie')
require('rest-client')

get("/") do
  @movies = (Movie.all()).sort
  @actors = Actor.all()
  erb(:index)
end

get("/movies") do
  @movies = Movie.all()
  erb(:movies)
end

get("/actors") do
  @actors = Actor.all()
  erb(:actors)
end

post("/degrees") do
  @movies = Movie.all()
  @actors = Actor.all()

  @actor = Actor.find_by(name: params.fetch('actor_one'))
  actor_two = Actor.find_by(name: params.fetch('actor_two'))
  if @actor == nil || actor_two == nil || @actor.name == actor_two.name
    erb(:errors)
  else
    @degrees = @actor.degrees(actor_two.id)
  erb(:degrees)
  end
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
  name = params.fetch("actor_name")
  @actor = Actor.create({:name => name})
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
  name = params.fetch("new_actor_name")
  @actor = Actor.find(params.fetch("id").to_i)
  @actor.update({:name => name})
  redirect("/actors/#{actor_id}")
end

delete("/actor_delete/:id") do
  actor_id = params.fetch("id").to_i
  @actor = Actor.find(params.fetch("id").to_i)
  @actor.delete
  redirect("/")
end

get("/load-db") do
  movies = Movie.Load_movies
  erb :test
end
