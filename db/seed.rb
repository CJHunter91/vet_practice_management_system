require_relative('../models/appointment')
require_relative('../models/owner')
require_relative('../models/pet')

owner1 = Owner.new({
  'name' => 'Chris',
  'address' => 'Edinburgh',
  'phone' => '01312281211'
  })

owner1.save

pet1 = Pet.new({
  'name' => 'KitKat', 
  'age' => 4,
  'type' => 'Cat', 
  'Breed' => 'Short Haired', 
  'owner_id' => owner1.id
  })
