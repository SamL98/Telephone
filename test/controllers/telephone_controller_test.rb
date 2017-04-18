require 'test_helper'

class TelephoneControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get '/'
    assert_response :success
  end

  test "should not start survey without chain id" do
    get '/home', params: { name: "user1", place: 1 }
    assert_response :failure
  end

  test "should not start survey without username" do
    get '/home', params: { chain: 'M1', place: 1 }
    assert_response :failure
  end

  test "should not start survey without place" do
    get '/home', params: { chain: 'M1', name: 'user1' }
    assert_response :failure
  end

  test "should start survey with proper params" do
    get '/home', params: { chain: 'M1', name: 'user1', place: 1 }
    assert_response :success
  end

  test "home should create new user" do
    init_count = User.count
    get '/home', params: { name: "user1", place: 1, chain: 'M1' }
    final_count = User.count
    assert_equal final_count = init_count + 1
    assert_response :success
  end

  test 'should get survey, redirect to finish with invalid params' do
    get '/start'
    assert_routing '/start', '/finish'
    assert_response :success
  end

  test 'should finish' do
    get '/finish'
    assert_response :success
  end

end
