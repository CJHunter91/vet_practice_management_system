require_relative('../db/sql_runner')
class Owner

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @address = details['address']
    @phone = details['phone']
  end

  def save
    values = [@name, @address, @phone]
    sql = "INSERT INTO owners
      (name, address, phone)
      VALUES
      ($1, $2, $3)
      RETURNING id;"
      @id = SqlRunner.run(sql, values)[0]['id']
  end
end