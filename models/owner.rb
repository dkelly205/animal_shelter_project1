require_relative('../db/sql_runner.rb')

class Owner

  attr_reader :id, :name, :address, :phone_number, :pets

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @address = options["address"]
    @phone_number = options["phone_number"]
    @pets = options["pets"]
  end

end
