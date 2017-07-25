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

  def self.delete_all
    values = []
    sql = "DELETE FROM appointment_times"
    SqlRunner.run(sql, values)
  end
end