require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('.lib/purchase')
require('.lib/product')
require('pg')

get('/') do
  @page_title = "home"
  @products = Product.all
  erb(:index)
end
