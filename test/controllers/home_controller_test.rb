require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login index" do
    login(users(:one))
    get :index
    assert_response :success
  end
end
