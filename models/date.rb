require_relative('../db/sql_runner')
require_relative('./appointment')

class ApDate 

  def initialize(params)
    @id = params['id']
    @year = params['year'].to_i
    @month = params['month'].to_i
    @day = params['day'].to_i
    @quarter = params['quarter'].to_i
    @day_of_week = params['day_of_week'].to_i
    @day_of_year = params['day_of_year'].to_i
    @week_of_year = params['week_of_year'].to_i
  end


  def self.get_todays_apps
    today = Time.now
    today = today.strftime("%F")
    values = [today]
    sql = "SELECT * FROM appointments
      WHERE app_date = $1;"
    appointments = SqlRunner.run(sql, values)
    return appointments.map{|app| Appointment.new(app)}
  end
end
