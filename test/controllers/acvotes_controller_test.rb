require 'test_helper'

class AcvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get acvotes_new_url
    assert_response :success
  end

  test "should get destroy" do
    get acvotes_destroy_url
    assert_response :success
  end

end
