require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/appointment_controller')

get '/' do
  erb :index
end