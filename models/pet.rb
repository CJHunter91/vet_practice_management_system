require_relative('../db/sql_runner')

class Pet
  attr_reader :id, :name, :age, :type, :breed, :owner_id
  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @age = details['age'].to_i
    @type = details['type']
    @breed = details['breed']
    @owner_id = details['owner_id'].to_i
  end

  def save
      values = [@name, @age, @type, @breed, @owner_id]
      sql = "INSERT INTO pets
      (name, age, type, breed, owner_id)
      VALUES
      ($1, $2, $3, $4, $5)
      RETURNING id;"
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    values = [@name, @age, @type, @breed, @owner_id, @id]
    sql = "UPDATE pets SET
    (name, age, type, breed, owner_id)
    =
    ($1, $2, $3, $4, $5) 
    WHERE id = $6;"
    SqlRunner.run(sql, values)
  end

  def delete 
    values = [@id]
    sql = "DELETE FROM pets WHERE id = $1;"
    SqlRunner.run(sql, values)
  end

  def self.get_all
    values = []
    sql = "SELECT * FROM pets"
    pets = SqlRunner.run(sql, values)
    return pets.map{|pet| Pet.new( pet )}
  end

  def self.delete_all
    values = []
    sql = "DELETE FROM pets;"
    SqlRunner.run(sql, values)
  end
end