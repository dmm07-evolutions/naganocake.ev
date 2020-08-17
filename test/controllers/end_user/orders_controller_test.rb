require 'test_helper'

class EndUser::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get end_user_orders_new_url
    assert_response :success
  end

  test "should get show" do
    get end_user_orders_show_url
    assert_response :success
  end

  test "should get thanks" do
    get end_user_orders_thanks_url
    assert_response :success
  end

  test "should get history_index" do
    get end_user_orders_history_index_url
    assert_response :success
  end

  test "should get history_show" do
    get end_user_orders_history_show_url
    assert_response :success
  end

end
