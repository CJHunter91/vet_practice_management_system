require_relative('../models/owner')

get '/owners' do 
  @owners = Owner.get_all
  erb(:'owners/index')
end

get '/owners/:id' do 
  @owner = Owner.find(params[:id])
  @pets = @owner.get_pets
  erb(:'owners/show')
end

get '/owners/new' do 
  erb(:'owners/new')
end

post '/owners' do 
  Owner.new(params).save
end