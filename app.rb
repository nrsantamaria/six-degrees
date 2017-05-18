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

actors_array = ["Robert De Niro",
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
  "George Clooney",
  "Charlton Heston",
  "Anthony Hopkins",
  "Russell Crowe",
  "Katharine Hepburn",
  "Meryl Streep",
  "Jennifer Lawrence",
  "Kate Winslet",
  "Elizabeth Taylor",
  "Cate Blanchett",
  "Audrey Hepburn",
  "Nicole Kidman",
  "Sandra Bullock",
  "Natalie Portman",
  "Jodie Foster",
  "Judi Dench",
  "Amy Adams",
  "Julia Roberts",
  "Emma Thompson",
  "Diane Keaton",
  "Grace Kelly",
  "Reese Witherspoon",
  "Charlize Theron",
  "Judy Garland",
  "John Wayne",
  "Sidney Poitier",
  "Paul Newman",
  "Matt Damon",
  "Robert Duvall",
  "James Dean",
  "Kirk Douglas",
  "Henry Fonda",
  "Robin Williams",
  "Orson Welles",
  "Heath Ledger",
  "Sean Connery",
  "Kevin Spacey",
  "Gene Hackman",
  "Liam Neeson",
  "Edward Norton",
  "Bruce Willis",
  "Gary Cooper",
  "Philip Seymour Hoffman",
  "Robert Redford",
  "Ralph Fiennes",
  "Joaquin Phoenix",
  "Will Smith",
  "Steve McQueen",
  "Angelina Jolie",
  "Anne Hathaway",
  "Maggie Smith",
  "Sophia Loren",
  "Joan Crawford",
  "Kathy Bates",
  "Julie Andrews",
  "Marion Cotillard",
  "Deborah Kerr",
  "Sissy Spacek",
  "Susan Sarandon",
  "Glenn Close",
  "Jane Fonda",
  "Jeff Bridges",
  "Ben Kingsley",
  "Tommy Lee Jones",
  "Samuel L. Jackson",
  "Jack Lemmon",
  "Joe Pesci",
  "Christopher Plummer",
  "Morgan Freeman",
  "Christopher Walken",
  "John Travolta",
  "James Stewart",
  "Matthew McConaughey",
  "Peter O'Toole",
  "John Cusack",
  "Bill Murray",
  "Robert Downey Jr.",
  "Nicolas Cage",
  "Gene Wilder",
  "Kevin Costner",
  "Donald Sutherland",
  "Ava Gardner",
  "Jennifer Jones",
  "Sally Field",
  "Holly Hunter",
  "Hilary Swank",
  "Diane Lane",
  "Jessica Lange",
  "Frances McDormand",
  "Bette Midler",
  "Mary Tyler Moore",
  "Halle Berry",
  "Sharon Stone",
  "Kim Basinger",
  "Glenda Jackson",
  "Donna Reed",
  "Geena Davis",
  "Demi Moore",
  "Michelle Pfeiffer",
  "Liza Minnelli",
  "Charles Chaplin",
  "Peter Sellers",
  "Woody Allen",
  "Jon Voight",
  "Mel Gibson",
  "Jim Carrey",
  "Mark Wahlberg",
  "Steve Martin",
  "Tim Robbins",
  "Arnold Schwarzenegger",
  "Sylvester Stallone",
  "Viggo Mortensen",
  "Hugo Weaving",
  "Christopher Lee",
  "Geoffrey Rush",
  "Alec Guinness",
  "Richard Burton",
  "Alec Baldwin",
  "James Caan",
  "Michael Douglas",
  "Ben Stiller",
  "Willem Dafoe",
  "Ed Harris",
  "Harvey Keitel",
  "Drew Barrymore",
  "Winona Ryder",
  "Uma Thurman",
  "Rene Russo",
  "Annette Bening",
  "Sigourney Weaver",
  "Barbra Streisand",
  "Joanne Woodward",
  "Shirley Booth",
  "Anjelica Huston",
  "Dianne Wiest",
  "Goldie Hawn",
  "Judy Davis",
  "Gwyneth Paltrow",
  "Julianne Moore",
  "Debra Winger",
  "Christina Ricci",
  "Juliette Binoche",
  "Daryl Hannah",
  "Whoopi Goldberg",
  "Benicio Del Toro",
  "Kevin Bacon",
  "Patrick Swayze",
  "Michael Caine",
  "Clint Eastwood",
  "Colin Farrell",
  "William Powell",
  "Groucho Marx",
  "James Mason",
  "Buster Keaton",
  "Gene Kelly",
  "Fred Astaire",
  "Bradley Cooper",
  "Jude Law",
  "Robert Pattinson",
  "Paul Giamatti",
  "Forest Whitaker",
  "Jared Leto",
  "Jonah Hill",
  "Michael Fassbender",
  "Carol Burnett",
  "Jessica Tandy",
  "Helen Hunt",
  "Patricia Arquette",
  "Carmen Miranda",
  "Kate Hudson",
  "Catherine Zeta-Jones",
  "Cameron Diaz",
  "Rita Hayworth",
  "Maureen O'Hara",
  "Toni Collette",
  "Gillian Anderson",
  "Emma Watson",
  "Meg Ryan"
]

movie = Movie.new

actors_array.each do |actor_name|
@movies = movie.find_movies(movie.find_actor_id(actor_name))
  @movies.each do |movie|
    new_movie = Movie.create(title: movie[:title])
    movie[:actors].each do |actor|
      if Actor.exists?(name: actor)
        current_actor = Actor.find_by name: actor
        new_movie.actors.push(current_actor)
     else
        new_movie.actors.push(Actor.create(name: actor))
      end
    end
  end
end
erb :test
end
