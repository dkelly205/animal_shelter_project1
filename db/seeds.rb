require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/adopted_animal.rb')
require('pry')

Animal.delete_all


animal1 = Animal.new({
  'name' => 'Alfie',
  'type' => 'dog',
  'breed' => 'shitzu',
  'gender' => 'male',
  'health' => 50,
  'admission_date' => '08-Jan-2018',
  'image' => 'n/a',
  'adoptable' => true

  })

  animal1.save

  owner1 = Owner.new({
    'first_name' => 'John',
    'last_name' => 'Smith',
    'address' => '10 Crow Road, Glasgow, G10 6PP',
    'phone_number' => '01411111111'
    })

  owner1.save

  adopted_animal1 = AdoptedAnimal.new({
    'animal_id' => '1',
    'owner_id' => '1'

    })

    adopted_animal1.save


  binding pry
  nil
