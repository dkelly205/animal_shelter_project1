require 'minitest/autorun'
require_relative '../models/animal.rb'

class TestAnimal < Minitest::Test

  def setup
    @animal = Animal.new({
      'name' => 'Alfie',
      'type' => 'dog',
      'breed' => 'shitzu',
      'gender' => 'male',
      'health' => 50,
      'admission_date' => '08-Jan-2018',
      'image' => 'n/a',
      'adoptable' => false,
      'age' => 1
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

  def test_animal_gender
    assert_equal("male", @animal.gender)
  end

  def test_animal_health
    assert_equal( 50, @animal.health() )
  end

  def test_animal_admission_date
    assert_equal( "08-Jan-2018", @animal.admission_date() )
  end

  def test_animal_image
    assert_equal( "n/a", @animal.image() )
  end

  def test_animal_is_not_adoptable
    assert_equal( false, @animal.adoptable() )
  end

  def test_animal_age
    assert_equal( 1, @animal.age() )
  end





end
