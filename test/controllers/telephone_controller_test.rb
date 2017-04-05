require 'test_helper'

class TelephoneControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get '/'
    assert_response :success
  end

  test "should get start survey" do
    get '/home'
    assert_response :success
  end

  test "should create new user with unique id" do
    init_count = User.count
    get '/home', params: { name: "sdlfkjsdlfksjdf", place: 1 }
    final_count = User.count
    assert_equal final_count = init_count + 1
    assert_response :success
  end

  test "should not create new user with not unique id" do
    init_count = User.count
    get '/home', params: { name: "user1", place: 1 }
    final_count = User.count
    assert_equal final_count = init_count
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
