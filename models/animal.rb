require_relative('../db/sql_runner.rb')

class Animal

  attr_reader :id, :name, :type, :breed, :health, :admission_date

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @type = options["type"]
    @breed = options["breed"]
    @health = options["health"]
    @admission_date = options["admission_date"]
    # @adoptable = options["adoptable"]
  end

  def save()
    sql = "INSERT INTO animals (name, type, breed, health, admission_date, adoptable) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @type, @breed, @health, @admission_date, @adoptable]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM animals"
    animals = SqlRunner.run(sql)
    result = animals.map{|animal| Animal.new(animal)}
    return result
  end

  def adoptable()
    if (@health == 100)
      return true
    else
      return false
    end
  end

end
