require_relative('../models/pet')

get '/pet/:id/new' do
  erb(:"pets/new")
end

get '/pet/:owner_id/:pet_id' do
  @pet = Pet.new(params['pet_id'])
  @owner = @pet.get_owner
  erb(:"pets/show")
end

post '/pet' do 
  Pet.new( params ).save
  redirect to '/owners/' + params[:owner_id].to_s
end