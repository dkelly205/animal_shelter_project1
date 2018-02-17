require_relative('../db/sql_runner.rb')

class Animal

  attr_reader :id, :name, :type, :breed, :health, :admission_date, :adoptable

  def initialize(options)
    @id = options("id").to_i
    @name = options("name")
    @type = options("type")
    @breed = options("breed")
    @health = options("health")
    @admission_date = options("admission_date")
    @adoptable = options("adoptable")
  end

end
