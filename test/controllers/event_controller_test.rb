require 'test_helper'

class EventControllerTest < ActionDispatch::IntegrationTest
  test "should get event" do
    get event_event_url
    assert_response :success
  end

end
