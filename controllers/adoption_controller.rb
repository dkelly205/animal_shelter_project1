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
