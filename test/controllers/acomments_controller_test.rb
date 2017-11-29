require 'test_helper'

class AcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get acomments_new_url
    assert_response :success
  end

  test "should get create" do
    get acomments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get acomments_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get acomments_edit_url
    assert_response :success
  end

  test "should get update" do
    get acomments_update_url
    assert_response :success
  end

end
