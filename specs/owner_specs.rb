require 'minitest/autorun'
require_relative '../models/customer.rb'

class TestCustomer < Minitest::Test

  def setup
    @customer = Customer.new({
      'first_name' => 'John',
      'last_name' => 'Smith',
      'address' => '10 Smith Road, Glasgow, G66 1PP',
      'phone_number' => '01411111111'
      })
  end

  def test_customer_first_name
    assert_equal("John", @customer.first_name)
  end

  def test_customer_last_name
    assert_equal("Smith", @customer.last_name)
  end

  def test_customer_address
    assert_equal("10 Smith Road, Glasgow, G66 1PP", @customer.address)
  end

  def test_customer_phone_number
    assert_equal("01411111111", @customer.phone_number)
  end
end
