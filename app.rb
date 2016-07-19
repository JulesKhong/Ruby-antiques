require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/purchase')
require('./lib/product')
require('pg')

get('/') do
  @page_title = "Antiques"
  @products = Product.not_sold
  erb(:index)
end

post('/product/add') do
  description = params.fetch('description')
  price = params.fetch('price').to_f
  Product.create({:description => description, :price => price, :sold => false})
  redirect to '/'
end

get('/product/:id') do
  @product = Product.find(params.fetch('id'))
  erb(:product)
end

patch('/product/:id') do
  product = Product.find(params.fetch('id'))
  product.update({:description => params.fetch('description'), :price => params.fetch('price')})
  redirect to "/product/#{params.fetch('id')}"
end

get('/reports') do
  date_old = DateTime.new(2001,2,3)
  @purchases = Purchase.all
  @total = Purchase.total_sales(date_old, DateTime.now)
  erb(:reports)
end

post('/reports') do
  @purchases = Purchase.all
  @total = Purchase.total_sales(params.fetch('start_date'), params.fetch('end_date'))
  erb(:reports)
end

get('/pos') do
  @products = Product.not_sold
  erb(:pos)
end

# CHECKBOXES DON
post('checkout') do
  params.items.each
end
