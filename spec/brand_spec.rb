require("spec_helper")

describe(Brand) do
  it("has many stores") do
    brand1 = Brand.create({:name => "nike", :price => "$50.00"})
    store1 = Store.create({:name => "Macy's", :brand_ids => [brand1.id()]})
    store2 = Store.create({:name => "Nordstrom", :brand_ids => [brand1.id()]})
    expect(brand1.stores()).to(eq([store1, store2]))
  end
  it("will upcase the first letter of the name") do
    brand1 = Brand.new({:name => "nike", :price => "50.00"})
    brand1.save
    expect(brand1.name).to(eq("Nike"))
  end
  it("will ensure that a name is entered") do
    brand1 = Brand.new({:name => "", :price => "50.00"})
    expect(brand1.save).to(eq(false))
  end
  it("will ensure the length of the name is at most 100 characters") do
    brand1 = Brand.new({:name => "qweruyqwoieruyoqwieuyrqwoieuryqowieuyrqowieuryqoweiuryqowieuryqowieuryqowieuryq23iuyroqwieryqoiwueryqwoeiury", :price => "50.00"})
    expect(brand1.save).to(eq(false))
  end
  it("will ensure a new brand name is unique") do
    brand1 = Brand.new({:name => "nike", :price => "50.00"})
    brand1.save
    brand2 = Brand.new({:name => "nike", :price => "50.00"})
    expect(brand2.save).to(eq(false))
  end
end
