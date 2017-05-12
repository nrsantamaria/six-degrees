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
end
