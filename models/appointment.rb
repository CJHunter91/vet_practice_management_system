require_relative('../db/sql_runner')
require_relative('./pet')
require_relative('./appointment_time')


class Appointment
  attr_reader :id, :appointment_time_id, :duration, :needs_seen, :reason, :pet_id, :arrival, :app_date
  def initialize(details)
    @id = details['id'].to_i if details['id']
    @appointment_time_id = details['appointment_time_id'].to_i
    @duration = 30
    @reason = details['reason']
    @pet_id = details['pet_id'].to_i
    @app_date = details['app_date']
    @arrival = details['arrival'] ? details['arrival'] : nil
    #conversion of string into bool from db
    if details['needs_seen'] == 'f'
      @needs_seen = false
    else
      @needs_seen = true
    end
  end

  def get_todays
    today = Time.now
    today = today.strftime("%F")
  end

  def complete
    @needs_seen = false
    update()
  end

  def set_arrival
    time = Time.now
    time = time.strftime("%H:%M:%S")
    @arrival = time
    update()
  end

  def get_pet
    values = [@pet_id]
    sql = "SELECT * FROM pets
      WHERE id = $1;"
    pet = SqlRunner.run(sql, values)[0]
    return Pet.new( pet )
  end

  def get_time
    values = [@appointment_time_id]
    sql = "SELECT * FROM appointment_times
      WHERE id = $1"
    time = SqlRunner.run(sql, values)[0]
    return AppointmentTime.new(time)
  end

  def save
    values = [@appointment_time_id, @duration, @needs_seen, @reason, @arrival, @pet_id, @app_date]
    sql = "INSERT INTO appointments
    (appointment_time_id, duration, needs_seen, reason, arrival, pet_id, app_date)
    VALUES 
    ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id;"
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    values = [@id, @appointment_time_id, @duration, @needs_seen, @reason, @arrival, @pet_id, @app_date]
    sql = "UPDATE appointments SET
    (appointment_time_id, duration, needs_seen, reason, arrival, pet_id, app_date)
    =
    ($2, $3, $4, $5, $6, $7, $8) 
    WHERE id = $1;"
    SqlRunner.run(sql, values)
  end

  def delete
    values = [@id]
    sql = "DELETE FROM appointments WHERE id = $1;"
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    values = [id]
    sql = "SELECT * FROM appointments
      WHERE id = $1;"
    appointment = SqlRunner.run(sql, values).first
    return Appointment.new(appointment)
  end

  def self.get_all
    values = []
    sql = "SELECT * FROM appointments;"
    appointments = SqlRunner.run(sql, values)
    return appointments.map{|appointment| Appointment.new( appointment )}
  end

  def self.delete_all
    values = []
    sql = "DELETE FROM appointments;"
    SqlRunner.run(sql, values)
  end
end