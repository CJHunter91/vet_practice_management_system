require_relative('../models/appointment')
require_relative('../models/owner')
require_relative('../models/pet')
require_relative('../models/appointment_time')
require_relative('../models/date')

today = Time.now
tomorrow = today + 86400
tomorrow = tomorrow.strftime("%F")
today = today.strftime("%F")


Appointment.delete_all
Pet.delete_all
Owner.delete_all
AppointmentTime.delete_all

time1 = AppointmentTime.new({
  'available_time' => "09:00"
})
time2 = AppointmentTime.new({
  'available_time' => "09:30"
})
time3 = AppointmentTime.new({
  'available_time' => "10:00"
})
time4 = AppointmentTime.new({
  'available_time' => "10:30"
})
time5 = AppointmentTime.new({
  'available_time' => "11:00"
})
time6 = AppointmentTime.new({
  'available_time' => "11:30"
})
time7 = AppointmentTime.new({
  'available_time' => "12:00"
})

time1.save
time2.save
time3.save
time4.save
time5.save
time6.save
time7.save

owner1 = Owner.new({
  'first_name' => 'Chris',
  'last_name' => 'Hunter',
  'address' => 'Comely Bank Terrace',
  'postcode' => 'EH4 1AT',
  'phone' => '01312281211'
  })
owner2 = Owner.new({
  'first_name' => 'Dell',
  'last_name' => 'Middlemiss',
  'address' => '3 Juniper Hill',
  'postcode' => 'EH12 5JZ',
  'phone' => '01312281321'
  })

owner3 = Owner.new({
  'first_name' => 'John',
  'last_name' => 'John',
  'address' => '3 Inverleith Place',
  'postcode' => 'EH3 2HY',
  'phone' => '01312281231'
  })

owner1.save
owner2.save
owner3.save


pet1 = Pet.new({
  'name' => 'KitKat', 
  'age' => "2012-05-12",
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
  'age' => "09-09-1982",
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
  'appointment_time_id' => time1.id, 
  'needs_seen' => true, 
  'pet_id' => pet1.id, 
  'app_date' => today, 
  'reason' => "Needs vacinated."
  })
appointment2 = Appointment.new({
  'appointment_time_id' => time2.id, 
  'needs_seen' => true, 
  'pet_id' => pet2.id,
  'app_date' => today,
  'reason' => "Lump on abdomen." 
  })
appointment3 = Appointment.new({
  'appointment_time_id' => time3.id, 
  'needs_seen' => true, 
  'pet_id' => pet3.id,
  'app_date' => today,
  'reason' => 'Regular checkup.' 
  })
appointment4 = Appointment.new({
  'appointment_time_id' => time4.id, 
  'needs_seen' => true, 
  'pet_id' => pet4.id,
  'app_date' => today,
  'reason' => "Difficulty breathing." 
  })

appointment5 = Appointment.new({
  'appointment_time_id' => time7.id, 
  'needs_seen' => true, 
  'pet_id' => pet4.id,
  'app_date' => tomorrow,
  'reason' => "Difficulty breathing." 
  })

appointment1.save
appointment2.save
appointment3.save
appointment4.save
appointment5.save
