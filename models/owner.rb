require_relative('../db/sql_runner')
require_relative('./pet')

class Owner

  attr_reader :id, :name, :address, :phone

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @address = details['address']
    @phone = details['phone']
  end

  def get_pets
    values = [@id]
    sql = "SELECT * FROM pets
      WHERE owner_id = $1;"
    pets = SqlRunner.run(sql, values)
    return pets.map{|pet| Pet.new(pet)}
  end

  def save
    values = [@name, @address, @phone]
    sql = "INSERT INTO owners
      (name, address, phone)
      VALUES
      ($1, $2, $3)
      RETURNING id;"
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end
  
  def update
    values = [@name, @address, @phone, @id]
    sql = "UPDATE owners SET
      (name, address, phone)
      =
      ($1, $2, $3)
      WHERE id = $4;"
      SqlRunner.run(sql, values)
  end

  def delete
    values = [@id]
    sql = "DELETE FROM owners WHERE id = $1;"
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    values = [id]
    sql = "SELECT * FROM owners
      WHERE id = $1;"
      owner = SqlRunner.run(sql, values).first
      return Owner.new( owner )
  end

  def self.get_all
    values = []
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run(sql, values)
    return owners.map{|owner| Owner.new( owner )}
  end

  def self.delete_all
    values = []
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql, values)
  end
end