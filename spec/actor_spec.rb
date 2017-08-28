require("spec_helper")

describe(Actor) do
  it("returns movie actors are both in") do
    actor1 = Actor.create({:name => "nic cage"})
    actor2 = Actor.create({:name => "steve buscemi"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    movie2 = Movie.create({:title => "Don Air", :year => "1999", :actor_ids => [actor1.id]})
    expect(actor1.degrees(actor2.id)).to(eq("#{actor1.name}" "<br><span class='sm_text'> was in </span><br>" "\"#{movie1.title}\"" "<br><span class='sm_text'> with </span><br>" "#{actor2.name}"))
  end
  it("returns path actors are in") do
    actor1 = Actor.create({:name => "nic cage"})
    actor2 = Actor.create({:name => "steve buscemi"})
    actor3 = Actor.create({:name => "adam sandler"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    movie2 = Movie.create({:title => "Don Air", :year => "1999", :actor_ids => [actor1.id]})
    movie3 = Movie.create({:title => "The Cobbler", :year => "1999", :actor_ids => [actor2.id, actor3.id]})
    expect(actor1.degrees(actor3.id)).to(eq("#{actor1.name}" "<br><span class='sm_text'> was in </span><br>" "\"#{movie1.title}\"" "<br><span class='sm_text'> with </span><br>" "#{actor2.name}" "<br><span class='sm_text'> who was in </span><br>" "\"#{movie3.title}\"" "<br><span class='sm_text'> with </span><br>" "#{actor3.name}"))
  end
  it("returns path actors are in") do
    actor1 = Actor.create({:name => "nic cage"})
    actor2 = Actor.create({:name => "steve buscemi"})
    actor3 = Actor.create({:name => "adam sandler"})
    actor4 = Actor.create({:name => "drew barrymore"})
    movie1 = Movie.create({:title => "Con Air", :year => "1997", :actor_ids => [actor1.id, actor2.id]})
    movie2 = Movie.create({:title => "Don Air", :year => "1999", :actor_ids => [actor1.id]})
    movie3 = Movie.create({:title => "The Cobbler", :year => "1999", :actor_ids => [actor2.id, actor3.id]})
    movie4 = Movie.create({:title => "50 First Dates", :year => "2004", :actor_ids => [actor3.id, actor4.id]})
    expect(actor1.degrees(actor4.id)).to(eq("#{actor1.name}" "<br><span class='sm_text'> was in </span><br>" "\"#{movie1.title}\"" "<br><span class='sm_text'> with </span><br>" "#{actor2.name}" "<br><span class='sm_text'> who was in </span><br>" "\"#{movie3.title}\"" "<br><span class='sm_text'> with </span><br>" "#{actor3.name}" "<br><span class='sm_text'> who was in </span><br>" "\"#{movie4.title}\"" "<br><span class='sm_text'> with </span><br>" "#{actor4.name}" ))
  end
end
