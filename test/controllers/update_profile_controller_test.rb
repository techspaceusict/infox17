require 'test_helper'

class UpdateProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get update_profile_profile_url
    assert_response :success
  end

  test "should get show" do
    get update_profile_show_url
    assert_response :success
  end

end
