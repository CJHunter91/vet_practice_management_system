require_relative('../models/appointment')

get '/appointments' do
  @appointments = Appointment.get_all
  erb(:'appointments/index')
end

get '/appointments/:id' do
  @appointment = Appointment.find(params[:id])
  @pet = @appointment.get_pet
  @owner = @pet.get_owner
  erb(:"appointments/show")
end

get '/appointments/new' do
  erb(:'appointments/new')
end

post '/appointments' do
  Appointment.new(params).save
  redirect to '/appointments'
end

# get '/appointments/:id/edit' do 
#   erb(:"appointments/edit")
# end