require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animal_controller')


get '/' do
  erb( :index )
end
