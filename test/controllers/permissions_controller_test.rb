require 'test_helper'

class PermissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get permissions_index_url
    assert_response :success
  end

  test "should get edit" do
    get permissions_edit_url
    assert_response :success
  end

  test "should get update" do
    get permissions_update_url
    assert_response :success
  end

end
