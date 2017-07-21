require('pry')
require_relative('../models/appointment')
require_relative('../models/owner')
require_relative('../models/pet')


Appointment.delete_all
Pet.delete_all
Owner.delete_all

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
  'breed' => 'Short Haired', 
  'owner_id' => owner1.id
  })

pet1.save

appointment1 = Appointment.new({
  'appointment_time' => '10:00', 
  'duration' => 10,
  'needs_seen' => true, 
  'pet_id' => pet1.id, 
  })

appointment1.save

appointment_a = Appointment.new({
  'id' => appointment1.id,
  'appointment_time' => '20:00', 
  'duration' => 15,
  'needs_seen' => false, 
  'pet_id' => pet1.id, 
  })
appointment_a.update
binding.pry
nil