require('minitest/autorun')
require_relative('../models/pet')
require_relative('../models/owner')
require_relative('../models/appointment')

class TestAppointment < MiniTest::Test

  def setup
    @owner1 = Owner.new({
      'name' => 'Chris',
      'address' => 'Edinburgh',
      'phone' => '01312281211'
      })

    @owner1.save

    @pet1 = Pet.new({
      'name' => 'KitKat', 
      'age' => 4,
      'type' => 'Cat', 
      'breed' => 'Short Haired', 
      'owner_id' => @owner1.id
      })

    @pet1.save

    @appointment1 = Appointment.new({
      'appointment_time' => '10:00', 
      'duration' => 10,
      'needs_seen' => true, 
      'pet_id' => @pet1.id, 
      })
  end

  def test_pet_id
    assert_equal(@pet1.id, @appointment1.pet_id)
  end
end