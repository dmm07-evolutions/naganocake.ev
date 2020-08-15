require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get thanks" do
    get orders_thanks_url
    assert_response :success
  end

end
