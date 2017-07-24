require_relative('../models/owner')

get '/owners' do 
  @owners = Owner.get_all
  erb(:'owners/index')
end

get '/owners/new' do 
  erb(:'owners/new')
end

post '/owners' do 
  Owner.new(params).save
end

get '/owners/:id' do 
  @owner = Owner.find(params[:id])
  @pets = @owner.get_pets
  erb(:'owners/show')
end

get '/owners/:id/edit' do 
  @owner = Owner.find(params[:id])
  erb(:'owners/edit')
end

post '/owners/edit' do
  Owner.new(params).update
  redirect to '/owners/' + params[:id].to_s
end

post '/owners/delete' do
  Owner.find(params[:id]).delete
  redirect to '/owners'
end