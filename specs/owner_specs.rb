require 'minitest/autorun'
require_relative '../models/owner.rb'

class TestOwner < Minitest::Test

  def setup
    @owner = Owner.new({
      'first_name' => 'John',
      'last_name' => 'Smith',
      'address' => '10 Smith Road, Glasgow, G66 1PP',
      'phone_number' => '01411111111'
      })
  end

  def test_owner_first_name
    assert_equal("John", @owner.first_name)
  end

  def test_owner_last_name
    assert_equal("Smith", @owner.last_name)
  end

  def test_owner_address
    assert_equal("10 Smith Road, Glasgow, G66 1PP", @owner.address)
  end

  def test_owner_phone_number
    assert_equal("01411111111", @owner.phone_number)
  end
end
