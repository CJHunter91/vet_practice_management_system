  
class Appointment

  def initialize(details)
    @id = details['id'] if details['id']
    @time = details['time']
    @duration = details['duration']
    @needs_seen = details['needs_seen']
    @pet_id = details['pet_id']
  end
  
end