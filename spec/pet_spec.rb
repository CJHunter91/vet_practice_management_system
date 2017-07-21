require('minitest/autorun')
require_relative('../models/pet')
require_relative('../models/owner')

class TestPet < MiniTest::Test

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
      'Breed' => 'Short Haired', 
      'owner_id' => @owner1.id
      })
  end

  def test_owner_id
    assert_equal(@owner1.id, @pet1.owner_id)
  end
end