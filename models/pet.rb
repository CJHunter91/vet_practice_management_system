require_relative('../db/sql_runner')
require_relative('./owner')
require('pry')

class Pet
  attr_reader :id, :name, :age, :type, :breed, :sex, :owner_id
  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @age = details['age'].to_i
    @type = details['type']
    @breed = details['breed']
    @sex = details['sex']
    @owner_id = details['owner_id'].to_i
  end

  def save
      values = [@name, @age, @type, @breed, @sex, @owner_id]
      sql = "INSERT INTO pets
      (name, age, type, breed, sex, owner_id)
      VALUES
      ($1, $2, $3, $4, $5, $6)
      RETURNING id;"
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def get_owner
    values = [@owner_id]
    sql = "SELECT * FROM owners
      WHERE id = $1;"
    owner = SqlRunner.run(sql, values).first
    return Owner.new(owner)
  end

  def update
    values = [@name, @age, @type, @breed, @sex, @owner_id, @id]
    sql = "UPDATE pets SET
    (name, age, type, breed, sex, owner_id)
    =
    ($1, $2, $3, $4, $5, $6) 
    WHERE id = $7;"
    SqlRunner.run(sql, values)
  end

  def delete 
    values = [@id]
    sql = "DELETE FROM pets WHERE id = $1;"
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    values = [id]
    sql = "SELECT * FROM pets
      WHERE id = $1;"    
    pet = SqlRunner.run(sql, values).first
    return Pet.new(pet)
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