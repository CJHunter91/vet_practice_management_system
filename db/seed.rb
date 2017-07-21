require_relative('../models/appointment')
require_relative('../models/owner')
require_relative('../models/pet')

owner1 = Owner.new({
  'name' => 'Chris',
  'address' => 'Edinburgh',
  'phone' => '01312281211'
  })

owner1.save

