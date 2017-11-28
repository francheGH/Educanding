require 'test_helper'

class AvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get avotes_new_url
    assert_response :success
  end

  test "should get destroy" do
    get avotes_destroy_url
    assert_response :success
  end

end
