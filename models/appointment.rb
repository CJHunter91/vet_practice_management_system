require_relative('../db/sql_runner')

class Appointment
  attr_reader :id, :appointment_time, :duration, :needs_seen, :pet_id
  def initialize(details)
    @id = details['id'].to_i if details['id']
    @appointment_time = details['appointment_time']
    @duration = details['duration'].to_i
    @pet_id = details['pet_id'].to_i

    #conversion of string into bool from db
    if details['needs_seen'] == 't'
      @needs_seen = true
    elsif details['needs_seen'] == 'f'
      @needs_seen = false
    else
      @needs_seen = details['needs_seen']
    end
  end

  def save
    values = [@appointment_time, @duration, @needs_seen, @pet_id]
    sql = "INSERT INTO appointments
    (appointment_time, duration, needs_seen, pet_id)
    VALUES 
    ($1, $2, $3, $4)
    RETURNING id;"
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    values = [@id, @appointment_time, @duration, @needs_seen, @pet_id]
    sql = "UPDATE appointments SET
    (appointment_time, duration, needs_seen, pet_id)
    =
    ($2, $3, $4, $5) 
    WHERE id = $1;"
    SqlRunner.run(sql, values)
  end

  def delete
    values = [@id]
    sql = "DELETE FROM appointments WHERE id = $1;"
    SqlRunner.run(sql, values)
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