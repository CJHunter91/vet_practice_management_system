
class Owner

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @address = details['address']
    @phone = details['phone']
  end
  
end