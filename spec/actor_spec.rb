require("spec_helper")

describe(Actor) do
  it("returns movie actors are both in") do
    actor1 = Actor.create({:first_name => "nic", :last_name => "cage"})
    actor2 = Actor.create({:first_name => "steve", :last_name => "buscemi"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    movie2 = Movie.create({:title => "Don Air", :year => "1999", :actor_ids => [actor1.id]})
    expect(actor1.degrees(actor2.id)).to(eq([actor1.first_name, movie1.title, actor2.first_name]))
  end
  it("returns path actors are in") do
    actor1 = Actor.create({:first_name => "nic", :last_name => "cage"})
    actor2 = Actor.create({:first_name => "steve", :last_name => "buscemi"})
    actor3 = Actor.create({:first_name => "adam", :last_name => "sandler"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    movie2 = Movie.create({:title => "Don Air", :year => "1999", :actor_ids => [actor1.id]})
    movie3 = Movie.create({:title => "The Cobbler", :year => "1999", :actor_ids => [actor2.id, actor3.id]})
    expect(actor1.degrees(actor3.id)).to(eq([actor1.first_name, movie1.title, actor2.first_name, movie3.title, actor3.first_name]))
  end
  it("returns path actors are in") do
    actor1 = Actor.create({:first_name => "nic", :last_name => "cage"})
    actor2 = Actor.create({:first_name => "steve", :last_name => "buscemi"})
    actor3 = Actor.create({:first_name => "adam", :last_name => "sandler"})
    actor4 = Actor.create({:first_name => "drew", :last_name => "barrymore"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    movie2 = Movie.create({:title => "Don Air", :year => "1999", :actor_ids => [actor1.id]})
    movie3 = Movie.create({:title => "The Cobbler", :year => "1999", :actor_ids => [actor2.id, actor3.id]})
    movie4 = Movie.create({:title => "50 First Dates", :year => "2004", :actor_ids => [actor3.id, actor4.id]})
    expect(actor1.degrees(actor4.id)).to(eq([actor1.first_name, movie1.title, actor2.first_name,  movie3.title, actor3.first_name, movie4.title, actor4.first_name]))
  end
end
