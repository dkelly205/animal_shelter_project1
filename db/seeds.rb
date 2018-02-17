require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require('pry')

Animal.delete_all


animal1 = Animal.new({
  'name' => 'Alfie',
  'type' => 'dog',
  'breed' => 'shitzu',
  'health' => '50',
  'admission_date' => '08-Jan-2018',

  })

  animal2 = Animal.new({
    'name' => 'Simba',
    'type' => 'cat',
    'breed' => 'british shorthair',
    'health' => '70',
    'admission_date' => '08-Jan-2018',

    })

    animal3 = Animal.new({
      'name' => 'Darcie',
      'type' => 'dog',
      'breed' => 'cockapoo',
      'health' => '100',
      'admission_date' => '08-Jan-2018',

      })
  animal1.save
  animal2.save
  animal3.save


  binding pry
  nil
