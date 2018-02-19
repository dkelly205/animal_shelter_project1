require_relative('../db/sql_runner.rb')
require_relative('../models/customer.rb')

class Animal

  attr_reader :id, :name, :type, :breed, :gender, :health, :admission_date, :image, :adoptable, :age

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
    @type = options["type"]
    @breed = options["breed"]
    @gender = options["gender"]
    @health = options["health"].to_i()
    @admission_date = options["admission_date"]
    @image = options['image']
    @adoptable = options['adoptable']
    @age = options['age'].to_i()

  end

  def save()
    sql = "INSERT INTO animals (name, type, breed, gender, health, admission_date, image, adoptable, age) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *"
    values = [@name, @type, @breed, @gender, @health, @admission_date, @image, @adoptable, @age]
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

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    animal = SqlRunner.run(sql, values)
    result = Animal.new(animal.first)
    return result
  end

  def customers()
      sql = "SELECT c.* FROM customers c INNER JOIN adoptions ON adoptions.customer_id = c.id WHERE adoptions.animal_id = $1;"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map { |customer| Customer.new(customer) }
  end

  def self.delete(id)
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      name, type, breed, gender, health, admission_date, image, adoptable, age
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7, $8, $9
    )
    WHERE id = $10"
    values = [@name, @type, @breed, @gender, @health, @admission_date, @image, @adoptable, @age, @id]
    SqlRunner.run( sql, values )
  end


end
