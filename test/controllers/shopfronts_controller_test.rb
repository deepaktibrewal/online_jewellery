require 'test_helper'

class ShopfrontsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get shopfronts_view_url
    assert_response :success
  end

  test "should get cart" do
    get shopfronts_cart_url
    assert_response :success
  end

end
