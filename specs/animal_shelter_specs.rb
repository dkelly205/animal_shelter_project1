require 'minitest/autorun'
require_relative '../models/animal.rb'

class TestAnimal < Minitest::Test

  def setup
    @animal = Animal.new({
      'name' => 'Alfie',
      'type' => 'dog',
      'breed' => 'shitzu',
      'health' => '50',
      'admission_date' => '08-Jan-2018',
      'adoptable' => false
      })
  end

  def test_animal_name
    assert_equal( "Alfie", @animal.name() )
  end

  def test_animal_type
    assert_equal( "dog", @animal.type() )
  end

  def test_animal_name
    assert_equal( "shitzu", @animal.breed() )
  end

  def test_animal_health
    assert_equal( "50", @animal.health() )
  end

  def test_animal_admission_date
    assert_equal( "08-Jan-2018", @animal.admission_date() )
  end

  def test_animal_is_adoptable
    assert_equal( false, @animal.adoptable() )
  end

end
