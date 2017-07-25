require_relative('../db/sql_runner')

class AppointmentTime

  attr_reader :id, :available_time

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @available_time = params['available_time']
  end

  def save
    values = [@available_time]
    sql = "INSERT INTO appointment_times 
    (available_time)
    VALUES
    ($1)
    RETURNING id;"
    @id = SqlRunner.run(sql, values)[0]['id']
  end

  def self.get_available_times
    values = []
    sql = "SELECT appointment_times.* FROM appointment_times
    LEFT JOIN appointments 
    ON appointment_times.id = appointments.appointment_time_id 
    WHERE appointments.appointment_time_id IS NULL "
    times = SqlRunner.run(sql, values)
    return times.map{|time| AppointmentTime.new(time)}
  end

  def self.delete_all
    values = []
    sql = "DELETE FROM appointment_times"
    SqlRunner.run(sql, values)
  end

  def self.get_all
    values = []
    sql = "SELECT * FROM appointment_times"
    times = SqlRunner.run(sql, values)
    return times.map{|time| AppointmentTime.new(time)}
  end
end