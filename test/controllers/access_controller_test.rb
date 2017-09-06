require 'test_helper'

class AccessControllerTest < ActionDispatch::IntegrationTest
  test "should get shop_front" do
    get access_shop_front_url
    assert_response :success
  end

  test "should get login" do
    get access_login_url
    assert_response :success
  end

end
