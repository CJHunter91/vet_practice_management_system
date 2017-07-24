require_relative('../models/appointment')

# index
get '/appointments' do
  @appointments = Appointment.get_all
  erb(:'appointments/index')
end

# show
get '/appointments/:id' do
  @appointment = Appointment.find(params[:id])
  @pet = @appointment.get_pet
  @owner = @pet.get_owner
  erb(:"appointments/show")
end


get '/appointments/new' do
  erb(:'appointments/new')
end

# create
post '/appointments' do
  Appointment.new(params).save
  redirect to '/appointments'
end


get '/appointments/:id/edit' do
  @appointment = Appointment.find(params[:id])
  @pet = @appointment.get_pet
  erb(:"appointments/edit")
end

# update
post '/appointments/edit' do 
  p params, "*******************"
  Appointment.new(params).update
  redirect to '/appointments/' + params[:id].to_s
end