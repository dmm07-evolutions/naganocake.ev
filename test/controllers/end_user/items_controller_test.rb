require 'test_helper'

class EndUser::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_items_index_url
    assert_response :success
  end

  test "should get show" do
    get end_user_items_show_url
    assert_response :success
  end

end
