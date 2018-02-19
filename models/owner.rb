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



end
