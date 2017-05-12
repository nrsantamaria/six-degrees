require("spec_helper")
describe(Store) do
  it("has many brands") do
    store1 = Store.create({:name => "Macy's"})
    brand1 = Brand.create({:name => "nike", :price => "50.00", :store_ids => [store1.id]})
    brand2 = Brand.create({:name => "adidas", :price => "40.00", :store_ids => [store1.id]})
    expect(store1.brands()).to(eq([brand1, brand2]))
  end
  it("will upcase the first letter of the name") do
    store1 = Brand.new({:name => "macys"})
    store1.save
    expect(store1.name).to(eq("Macys"))
  end
  it("will ensure that a name is entered") do
    store1 = Store.create({:name => "Macy's"})
    expect(store1.save).to(eq(true))
  end
  it("will ensure the length of the name is at most 100 characters") do
    store1 = Store.new({:name => "qweruyqwoieruyoqwieuyrqwoieuryqowieuyrqowieuryqoweiuryqowieuryqowieuryqowieuryq23iuyroqwieryqoiwueryqwoeiury"})
    expect(store1.save).to(eq(false))
  end
end
