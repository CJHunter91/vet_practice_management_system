require_relative('../models/pet')

get '/pet/:id/new' do
  erb(:"pets/new")
end

post '/pet' do 
  Pet.new( params ).save
end