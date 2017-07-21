
class Pet
  attr_reader :id, :name, :age, :type, :breed, :owner_id
  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @age = details['age']
    @type = details['type']
    @breed = details['breed']
    @owner_id = details['owner_id']
  end

  def save
      values = [@name, @age, @type, @breed, @owner_id]
      sql = "INSERT INTO pets
      (name, age, type, breed, owner_id)
      VALUES
      ($1, $2, $3, $4, $5)
      RETURNING id;"
      @id = SqlRunner.run(sql, values)[0]['id']
  end

  def self.delete_all
    values = []
    sql = "DELETE FROM pets"
    SqlRunner.run(sql, values)
  end
end