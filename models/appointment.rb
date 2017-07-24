require_relative('../db/sql_runner')
require_relative('./pet')


class Appointment
  attr_reader :id, :appointment_time, :duration, :needs_seen, :reason,:pet_id
  def initialize(details)
    @id = details['id'].to_i if details['id']
    @appointment_time = details['appointment_time']
    @duration = details['duration'].to_i
    @reason = details['reason']
    @pet_id = details['pet_id'].to_i

    #conversion of string into bool from db
    if details['needs_seen'] == 'f'
      @needs_seen = false
    else
      @needs_seen = true
    end
  end

  def get_pet
    values = [@pet_id]
    sql = "SELECT * FROM pets
      WHERE id = $1;"
    pet = SqlRunner.run(sql, values)[0]
    return Pet.new( pet )
  end

  def save
    values = [@appointment_time, @duration, @needs_seen, @reason, @pet_id]
    sql = "INSERT INTO appointments
    (appointment_time, duration, needs_seen, reason, pet_id)
    VALUES 
    ($1, $2, $3, $4, $5)
    RETURNING id;"
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    values = [@id, @appointment_time, @duration, @needs_seen, @reason, @pet_id]
    sql = "UPDATE appointments SET
    (appointment_time, duration, needs_seen, reason, pet_id)
    =
    ($2, $3, $4, $5, $6 ) 
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