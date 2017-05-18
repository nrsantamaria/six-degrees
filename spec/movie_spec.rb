require("spec_helper")
describe(Movie) do
  it("has many actors") do
    movie1 = Movie.create({:title => "Con Air", :year => "1997"})
    actor1 = Actor.create({:name => "nic cage", :movie_ids => [movie1.id()]})
    actor2 = Actor.create({:name => "steve buscemi", :movie_ids => [movie1.id()]})
    expect(movie1.actors()).to(eq([actor1, actor2]))
  end
end
