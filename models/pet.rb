
class Pet

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @age = details['age']
    @type = details['type']
    @breed = details['breed']
    @owner_id = details['owner_id']
  end


end