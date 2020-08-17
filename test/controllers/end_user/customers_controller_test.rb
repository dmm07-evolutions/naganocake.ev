require 'test_helper'

class EndUser::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_user_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get end_user_customers_edit_url
    assert_response :success
  end

  test "should get exit" do
    get end_user_customers_exit_url
    assert_response :success
  end

end
