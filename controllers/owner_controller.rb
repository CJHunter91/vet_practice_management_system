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