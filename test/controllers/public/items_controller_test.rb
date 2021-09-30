require 'test_helper'

class Public::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_items_create_url
    assert_response :success
  end

end
