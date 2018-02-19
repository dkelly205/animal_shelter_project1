require_relative( '../db/sql_runner' )

class Adoption

  attr_reader( :id, :animal_id, :customer_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions
    (
      animal_id,
      customer_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@animal_id, @customer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM adoptions"
    adoptions = SqlRunner.run(sql)
    result = adoptions.map{|adoption| Adoption.new(adoption)}
    return result
  end


    def customer()
      sql = "SELECT * FROM customers
      WHERE id = $1"
      values = [@customer_id]
      results = SqlRunner.run( sql, values )
      return Customer.new( results.first )
    end

    def animal()
      sql = "SELECT * FROM animals
      WHERE id = $1"
      values = [@animal_id]
      results = SqlRunner.run( sql, values )
      return Animal.new( results.first )
    end

    def self.delete(id)
      sql = "DELETE FROM adoptions
      WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
    end

end
