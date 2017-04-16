require 'test_helper'

class ChainTest < ActiveSupport::TestCase
  test "should not save without identifier" do
    chain = Chain.new()
    assert_not chain.save
  end

  test "should not save with invalid identifier" do
    chain = Chain.new(identifier: 'sdf')
    assert_not chain.save
  end

  test "should save with valid identifier single digit" do
    chain = Chain.new(identifier: 'M1')
    assert chain.save!
  end

  test "should save with valid identifier double digit" do
    chain = Chain.new(identifier: 'M10')
    assert chain.save!
  end

  test "should not save with neither M nor L prefix" do
    chain = Chain.new(identifier: 'N10')
    assert_not chain.save
  end
end
