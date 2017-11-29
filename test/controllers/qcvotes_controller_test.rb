require 'test_helper'

class QcvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get qcvotes_new_url
    assert_response :success
  end

  test "should get destroy" do
    get qcvotes_destroy_url
    assert_response :success
  end

end
