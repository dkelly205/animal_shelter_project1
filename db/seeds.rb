require_relative('../models/animal.rb')
require_relative('../models/customer.rb')
require_relative('../models/adoption.rb')
require('pry')

Customer.delete_all
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

  animal2 = Animal.new({
    'name' => 'Darcie',
    'type' => 'dog',
    'breed' => 'cockapoo',
    'gender' => 'female',
    'health' => 100,
    'admission_date' => '08-Jan-2018',
    'image' => 'n/a',
    'adoptable' => true

    })

  animal1.save
  animal2.save

  customer1 = Customer.new({
    'first_name' => 'John',
    'last_name' => 'Smith',
    'address' => '10 Crow Road, Glasgow, G10 6PP',
    'phone_number' => '01411111111'
    })

  customer1.save

  customer2 = Customer.new({
    'first_name' => 'Jane',
    'last_name' => 'Smith',
    'address' => '9 Crow Road, Glasgow, G10 6PP',
    'phone_number' => '0141000000'
    })


  customer2.save

  adoption1 = Adoption.new({
    'animal_id' => '1',
    'customer_id' => '1'

    })

    adoption2 = Adoption.new({
      'animal_id' => '2',
      'customer_id' => '1'

      })

    adoption1.save
    adoption2.save


  binding pry
  nil
