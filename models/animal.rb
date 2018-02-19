require_relative('../db/sql_runner.rb')

class Animal

  attr_reader :id, :name, :type, :breed, :gender, :health, :admission_date, :image, :adoptable

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
    # @owner_id = options['owner_id'].to_i()
  end

  def save()
    sql = "INSERT INTO animals (name, type, breed, gender, health, admission_date, image, adoptable) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id"
    values = [@name, @type, @breed, @gender, @health, @admission_date, @image, @adoptable]
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


end
