require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/appointment_controller')
require_relative('./controllers/owner_controller')

get '/' do
  erb :index
end