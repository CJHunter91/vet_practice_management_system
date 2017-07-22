require_relative('../models/pet')

get '/pet/new' do
  erb(:"pets/new")
end