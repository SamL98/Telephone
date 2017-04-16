require 'test_helper'

class PassageTest < ActiveSupport::TestCase
  test "should not save with negative chain id" do
    assert_not Passage.new(chain_id: -1, number: 0, text: "", derivation: 0, time_spent: 0).save
  end

  test "should not save with non-integer chain id" do
    assert_not Passage.new(chain_id: 1.5, number: 0, text: "", derivation: 0, time_spent: 0).save
  end

  test "should not save with non-existent chain id" do
    assert_not Passage.new(chain_id: 0, number: 0, text: "something", derivation: 0, time_spent: 0).save
  end

  test "should not save with negative number" do
    assert_not Passage.new(chain_id: 980190962, number: -1, text: "something", derivation: 0, time_spent: 0).save
  end

  test "should not save with non-integer number" do
    assert_not Passage.new(chain_id: 980190962, number: 1.5, text: "something", derivation: 0, time_spent: 0).save
  end

  test "should not save with non-existent number" do
    assert_not Passage.new(chain_id: 980190962, number: nil, text: "something", derivation: 0, time_spent: 0).save
  end

  test "should not save with negative derivation" do
    assert_not Passage.new(chain_id: 980190962, number: 0, text: "something", derivation: -1, time_spent: 0).save
  end

  test "should not save with non-integer derivation" do
    assert_not Passage.new(chain_id: 980190962, number: 0, text: "something", derivation: 1.5, time_spent: 0).save
  end

  test "should not save with non-existent derivation" do
    assert_not Passage.new(chain_id: 980190962, number: 0, text: "something", derivation: nil, time_spent: 0).save
  end

  test "should not save with negative time" do
    assert_not Passage.new(chain_id: 980190962, number: 0, text: "something", derivation: 0, time_spent: -1).save
  end

  test "should not save with non-existent time" do
    assert_not Passage.new(chain_id: 980190962, number: 0, text: "something", derivation: 0, time_spent: nil).save
  end

  test "should not save with non-existent text" do
    assert_not Passage.new(chain_id: 980190962, number: 0, text: "", derivation: 0, time_spent: 0).save
  end

  test "should save with correctly formatted parameters" do
    assert Passage.new(chain_id: 980190962, number: 0, text: "something", derivation: 0, time_spent: 0).save!
  end
end
