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
owner2 = Owner.new({
  'name' => 'Dell',
  'address' => 'Leith',
  'phone' => '01312281321'
  })

owner3 = Owner.new({
  'name' => 'John',
  'address' => 'Glasgow',
  'phone' => '01412281231'
  })

owner1.save
owner2.save
owner3.save


pet1 = Pet.new({
  'name' => 'KitKat', 
  'age' => "01-12-2012",
  'type' => 'Cat', 
  'breed' => 'Short Haired',
  'sex' => 'Female', 
  'owner_id' => owner1.id
  })
pet2 = Pet.new({
  'name' => 'Gonzo', 
  'age' => "04-05-1989",
  'type' => 'Muppet', 
  'breed' => 'Whatever', 
  'sex' => 'Male', 
  'owner_id' => owner2.id
  })
pet3 = Pet.new({
  'name' => 'Mr Pickles', 
  'age' => "10-08-2010",
  'type' => 'Dog', 
  'breed' => 'Collie',
  'sex' => 'Male',  
  'owner_id' => owner2.id
  })
pet4 = Pet.new({
  'name' => 'Scooby', 
  'age' => "1982-09-09",
  'type' => 'Dog', 
  'breed' => 'Great Dane', 
  'sex' => 'Male', 
  'owner_id' => owner2.id
  })

pet1.save
pet2.save
pet3.save
pet4.save

appointment1 = Appointment.new({
  'appointment_time' => '09:00', 
  'needs_seen' => true, 
  'pet_id' => pet1.id, 
  'reason' => "Needs vacinated."
  })
appointment2 = Appointment.new({
  'appointment_time' => '09:30', 
  'needs_seen' => true, 
  'pet_id' => pet2.id,
  'reason' => "Lump on abdomen." 
  })
appointment3 = Appointment.new({
  'appointment_time' => '10:00', 
  'needs_seen' => true, 
  'pet_id' => pet3.id,
  'reason' => 'Regular checkup.' 
  })
appointment4 = Appointment.new({
  'appointment_time' => '10:30', 
  'needs_seen' => true, 
  'pet_id' => pet4.id,
  'reason' => "Difficulty breathing." 
  })

appointment1.save
appointment2.save
appointment3.save
appointment4.save

binding.pry
nil