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
      'breed' => 'Short Haired', 
      'owner_id' => @owner1.id
      })
    @pet1.save
  end

  def test_owner_id
    assert_equal(@owner1.id, @pet1.owner_id)
  end

  def test_get_owner
    assert_equal(@owner1, @pet1.get_owner)
  end

  def test_self_find
    assert_equal(@pet1, Pet.find(@pet1.id))
  end
end