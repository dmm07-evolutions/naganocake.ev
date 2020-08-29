require 'test_helper'

class EndUser::ShippingAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_shipping_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get end_user_shipping_addresses_edit_url
    assert_response :success
  end

end
