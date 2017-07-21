  
class Appointment
  attr_reader :id, :time, :duration, :needs_seen, :pet_id
  def initialize(details)
    @id = details['id'] if details['id']
    @time = details['time']
    @duration = details['duration']
    @needs_seen = details['needs_seen']
    @pet_id = details['pet_id']
  end

  def save
    values = [@time, @duration, @needs_seen, @pet_id]
    sql = "INSERT INTO appointments
    (time, duration, needs_seen, pet_id)
    VALUES 
    ($1, $2, $3, $4)
    RETURNING id;"
    @id = SqlRunner.run(sql, values)[0]['id']
  end
end