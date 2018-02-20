require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id, :first_name, :last_name, :address, :phone_number, :full_name

  def initialize(options)
    @id = options["id"].to_i()
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @address = options["address"]
    @phone_number = options["phone_number"]
  end

  def full_name()
    return "#{first_name} #{last_name}"
  end

  def save()
    sql = "INSERT INTO customers (first_name, last_name, address, phone_number) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @address, @phone_number]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

  def animals()
    sql = "SELECT a.* FROM animals a INNER JOIN adoptions ON adoptions.animal_id = a.id WHERE adoptions.customer_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal) }
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    customer = SqlRunner.run(sql, values)
    result = Customer.new(customer.first)
    return result
  end

  def delete()
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE customers
    SET
    (
      first_name, last_name, address, phone_number
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @address, @phone_number, @id]
    SqlRunner.run( sql, values )
  end







end
