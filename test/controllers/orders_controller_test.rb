require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get thanks" do
    get orders_thanks_url
    assert_response :success
  end

  test "should get histry_index" do
    get orders_histry_index_url
    assert_response :success
  end

  test "should get histry_show" do
    get orders_histry_show_url
    assert_response :success
  end

end
