require_relative('../db/sql_runner.rb')

class Owner

  attr_reader :id, :first_name, :last_name, :address, :phone_number

  def initialize(options)
    @id = options["id"].to_i()
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @address = options["address"]
    @phone_number = options["phone_number"]
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name, address, phone_number) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @address, @phone_number]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.all
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run(sql)
    result = owners.map{|owner| Owner.new(owner)}
    return result
  end

  def animals()
    sql = "SELECT a.* FROM animals a INNER JOIN adopted_animals  ON adopted_animals.animal_id = a.id WHERE adopted_animals.owner_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal) }
  end

  



end
