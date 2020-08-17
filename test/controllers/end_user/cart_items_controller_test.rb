require 'test_helper'

class EndUser::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_cart_items_index_url
    assert_response :success
  end

end
