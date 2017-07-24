require_relative('../models/pet')

get '/pet/:id' do
  @pet = Pet.find(params[:id])
  @owner = @pet.get_owner
  erb(:"pets/show")
end

get '/pet/:id/new' do
  erb(:"pets/new")
end

post '/pet' do 
  Pet.new( params ).save
  redirect to '/owners/' + params[:owner_id].to_s
end

get '/pet/:id/edit' do
  @pet = Pet.find(params[:id])
  erb(:"pets/edit")
end