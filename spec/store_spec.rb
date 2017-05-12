require("spec_helper")
describe(Store) do
  it("has many brands") do
    store1 = Store.create({:name => "Macy's"})
    brand1 = Brand.create({:name => "nike", :price => "50.00", :store_ids => [store1.id]})
    brand2 = Brand.create({:name => "adidas", :price => "40.00", :store_ids => [store1.id]})
    expect(store1.brands()).to(eq([brand1, brand2]))
  end
end
