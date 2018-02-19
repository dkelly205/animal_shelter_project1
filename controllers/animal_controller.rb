require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )


#index
get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

# create
post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  erb(:"animals/create")
end

get "/animals/new" do
  erb(:"animals/new")
end

get "/animals/:id" do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end
