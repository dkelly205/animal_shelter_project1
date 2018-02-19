require 'minitest/autorun'
require_relative '../models/animal.rb'
require_relative '../models/customer.rb'
require_relative '../models/adoption.rb'

class TestAdoptedAnimal < Minitest::Test

  def setup

      @adoption = Adoption.new({
        'animal_id' => 1,
        'customer_id' => 2
        })
  end

  def test_adopted_animal_id
    assert_equal(1, @adopted_animal.animal_id)
  end

  def test_adopted_owner_id
    assert_equal(2, @adopted_animal.customer_id)
  end

end
