require("spec_helper")

describe(Actor) do
  it("returns movie actors are both in") do
    actor1 = Actor.create({:first_name => "nic", :last_name => "cage"})
    actor2 = Actor.create({:first_name => "steve", :last_name => "buscemi"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    movie2 = Movie.create({:title => "Don Air", :year => "1999", :actor_ids => [actor1.id]})
    expect(actor1.degrees(actor2.id)).to(eq([movie1.title, actor1.first_name]))
  end
  it("returns movie actors are both in") do
    actor1 = Actor.create({:first_name => "nic", :last_name => "cage"})
    actor2 = Actor.create({:first_name => "steve", :last_name => "buscemi"})
    actor3 = Actor.create({:first_name => "adam", :last_name => "sandler"})
    actor4 = Actor.create({:first_name => "christopher", :last_name => "reeves"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    movie2 = Movie.create({:title => "Don Air", :year => "1999", :actor_ids => [actor1.id]})
    movie3 = Movie.create({:title => "The Cobbler", :year => "1999", :actor_ids => [actor2.id, actor3.id]})
    movie4 = Movie.create({:title => "Superman", :year => "1989", :actor_ids => [actor3.id, actor4.id]})
    expect(actor1.degrees(actor3.id)).to(eq([movie1.title, movie3.title, actor1.first_name, actor2.first_name]))
  end
end
