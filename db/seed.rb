require_relative('../models/appointment')
require_relative('../models/owner')
require_relative('../models/pet')

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
  'Breed' => 'Short Haired', 
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
