require_relative('../db/sql_runner')
require_relative('./pet')

class Owner

  attr_reader :id, :first_name, :last_name, :address, :postcode, :phone

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @first_name = details['first_name']
    @last_name = details['last_name']
    @address = details['address']
    @postcode = details['postcode']
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
    values = [@first_name, @last_name, @address, @postcode, @phone]
    sql = "INSERT INTO owners
      (first_name, last_name, address, postcode, phone)
      VALUES
      ($1, $2, $3, $4, $5)
      RETURNING id;"
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end
  
  def update
    values = [@first_name, @last_name, @address, @postcode, @phone, @id]
    sql = "UPDATE owners SET
      (first_name, last_name, address, postcode, phone)
      =
      ($1, $2, $3, $4, $5)
      WHERE id = $6;"
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