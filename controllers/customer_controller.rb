require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/customer.rb' )


#index
get '/customers' do
  @customers = Customer.all()
  erb(:"customers/index")
end

post '/customers' do
  @customer = Customer.new(params)
  @customer.save
  erb(:"customers/create")
end

get "/customers/new" do
  erb(:"customers/new")
end

post "/customers/:id/delete" do
  customer = Customer.find(params['id'])
  customer.delete()
  redirect to "/customers"
end

get "/customers/:id/edit" do
  @customer = Customer.find(params['id'])
  erb(:"customers/edit")
end

post "/customers/:id" do
  @customer = Customer.new(params)
  @customer.update()
  redirect to "/customers"
end
