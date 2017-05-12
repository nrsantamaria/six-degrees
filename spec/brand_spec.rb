require("spec_helper")

describe(Brand) do
  it("has many stores") do
    brand1 = Brand.create({:name => "nike", :price => "$50.00"})
    store1 = Store.create({:name => "Macy's", :brand_ids => [brand1.id()]})
    store2 = Store.create({:name => "Nordstrom", :brand_ids => [brand1.id()]})
    expect(brand1.stores()).to(eq([store1, store2]))
  end
end
