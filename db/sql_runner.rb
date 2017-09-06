require('pg')

class SqlRunner

  def self.run(sql, values)
    begin 
      # db = PG.connect({dbname: 'vet_db', host: 'localhost'})
      db = PG.connect( {dbname: 'd6g27l8p34166e', 
host: 'ec2-184-72-243-166.compute-1.amazonaws.com', 
port: 5432, user: 'sgnyqggeybgbww', password: 'b1380e775c16889dac6832b17c94ce5a95252683d8ade5019a50fbc0bc4735ef'})
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close
    end
    return result
  end
end