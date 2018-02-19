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
