require 'test_helper'

class ChainTest < ActiveSupport::TestCase
  test "should not save without identifier" do
    chain = Chain.new()
    assert_not chain.save
  end

  test "should not save with invalid identifier" do
    chain = Chain.new(identifier: -1)
    assert_not chain.save
  end

  test "should save with valid identifier" do
    chain = Chain.new(identifier: 0)
    assert chain.save
  end
end
