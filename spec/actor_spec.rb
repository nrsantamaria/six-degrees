require("spec_helper")

describe(Actor) do
  it("has many movies") do
    actor1 = Actor.create({:first_name => "nic", :last_name => "cage" :imdb_link => "http://www.imdb.com/name/nm0000115/"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id()]})
    movie2 = Movie.create({:title => "Kick-Ass", :year => "2010", :actor_ids => [actor1.id()]})
    expect(actor1.movies()).to(eq([movie1, movie2]))
  end
end
