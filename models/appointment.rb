  
class Appointment
  attr_reader :id, :appointment_time, :duration, :needs_seen, :pet_id
  def initialize(details)
    @id = details['id'] if details['id']
    @appointment_time = details['appointment_time']
    @duration = details['duration']
    @needs_seen = details['needs_seen']
    @pet_id = details['pet_id']
  end

  def save
    values = [@appointment_time, @duration, @needs_seen, @pet_id]
    sql = "INSERT INTO appointments
    (appointment_time, duration, needs_seen, pet_id)
    VALUES 
    ($1, $2, $3, $4)
    RETURNING id;"
    @id = SqlRunner.run(sql, values)[0]['id']
  end
end