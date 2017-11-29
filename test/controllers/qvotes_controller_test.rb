require 'test_helper'

class QvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get qvotes_new_url
    assert_response :success
  end

  test "should get destroy" do
    get qvotes_destroy_url
    assert_response :success
  end

end
