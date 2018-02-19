require_relative( '../db/sql_runner' )

class AdoptedAnimal

  attr_reader( :id, :animal_id, :owner_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

  def save()
    sql = "INSERT INTO adopted_animals
    (
      animal_id,
      owner_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@animal_id, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM adopted_animals"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM adopted_animals"
    animals = SqlRunner.run(sql)
    result = adopted_animals.map{|adopted_animal| AdoptedAnimal.new(adopted_animal)}
    return result
  end


    def owner()
      sql = "SELECT * FROM owners
      WHERE id = $1"
      values = [@owner_id]
      results = SqlRunner.run( sql, values )
      return Owner.new( results.first )
    end

    def animal()
      sql = "SELECT * FROM animals
      WHERE id = $1"
      values = [@animal_id]
      results = SqlRunner.run( sql, values )
      return Animal.new( results.first )
    end

end
