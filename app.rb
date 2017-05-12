require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/brand')
require('./lib/store')
also_reload('lib/**/*.rb')
require('pg')

get("/") do
  @stores = Store.all()
  erb(:index)
end

post("/stores") do
  name = params.fetch("new_store")
  store = Store.create({:name => name})
  redirect("/")
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i)
  erb(:store)
end

post("/stores/:id/brands") do
  store_id = params.fetch("id").to_i
  name = params.fetch("new_brand")
  price = params.fetch("new_brand_price")
  brand = Brand.create({:name => name, :price => price, :store_ids => [store_id]})
  redirect("/stores/#{store_id}")
end

get("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i)
  erb(:brand)
end

get("/store_edit/:id") do
  @store = Store.find_by(id: params.fetch("id").to_i)
  erb(:store_edit)
end

patch("/store_edit/:id") do
  store_id = params.fetch("id").to_i
  name = params.fetch("new_store_name")
  @store = Store.find(params.fetch("id").to_i)
  @store.update({:name => name})
  redirect("/stores/#{store_id}")
end

delete("/store_delete/:id") do
  store_id = params.fetch("id").to_i
  @store = Store.find(params.fetch("id").to_i)
  @store.delete
  redirect("/")
end
