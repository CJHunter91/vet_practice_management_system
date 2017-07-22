require_relative('../models/owner')

get '/owners' do 
  @owners = Owner.get_all
  erb(:'owners/index')
end