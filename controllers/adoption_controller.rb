require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/adoption.rb' )

get '/adoptions' do
  @adoptions = Adoption.all
  erb ( :"adoptions/index" )
end

get '/adoptions/new' do
  @customers = Customer.all
  @animals = Animal.all
  erb(:"adoptions/new")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save
  redirect to("/adoptions")
end

post "/adoptions/:id/delete" do
  Adoption.delete(params[:id])
  redirect to "/adoptions"
end
