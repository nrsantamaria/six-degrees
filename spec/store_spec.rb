require("spec_helper")
describe(Movie) do
  it("has many actors") do
    movie1 = Movie.create({:title => "Con Air", :year => "1997"})
    actor1 = Actor.create({:first_name => "nic", :last_name => "cage" :imdb_link => "http://www.imdb.com/name/nm0000115/", :movie_ids => [movie1.id()]})
    actor2 = Actor.create({:first_name => "steve", :last_name => "buscemi" :imdb_link => "http://www.imdb.com/name/nm0000114/", :movie_ids => [movie1.id()]})
    expect(movie1.actors()).to(eq([actor1, actor2]))
  end
end
