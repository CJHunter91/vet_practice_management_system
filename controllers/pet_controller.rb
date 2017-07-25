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
  p params, "************"

  Pet.new( params ).save
  redirect to '/owners/' + params[:owner_id].to_s
end

get '/pet/:id/edit' do
  @pet = Pet.find(params[:id])
  erb(:"pets/edit")
end

post '/pet/edit' do 
  p params, "************"
  Pet.new(params).update
  redirect to '/pet/' + params[:id].to_s
end 

post '/pet/delete' do 
  @pet_del = Pet.find(params['id'])
  @owner_del = @pet_del.get_owner
  @pet_del.delete
  redirect to '/owners/' + @owner_del.id.to_s
end