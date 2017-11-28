require 'test_helper'

class QcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get qcomments_new_url
    assert_response :success
  end

  test "should get create" do
    get qcomments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get qcomments_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get qcomments_edit_url
    assert_response :success
  end

end
