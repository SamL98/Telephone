require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save without name and place" do
    user = User.new
    assert_not user.save
  end

  test "should not save without name" do
    user = User.new(place: 0)
    assert_not user.save
  end

  test "should not save without formatted name" do
    user = User.new(name: "user", place: 0)
    assert_not user.save
  end

  test "should not save without place" do
    user = User.new(name: "user1")
    assert_not user.save
  end

  test "should not save without non-integer place" do
    user = User.new(name: "user1", place: 1.5)
    assert_not user.save
  end

  test "should not save without non-negative, integer place" do
    user = User.new(name: "user1", place: -1)
    assert_not user.save
  end

  test "should save with formatted name and place" do
    user = User.new(name: "user1", place: 0)
    assert user.save
  end
end
