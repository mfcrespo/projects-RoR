require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get send_mail" do
    get notifications_send_mail_url
    assert_response :success
  end
end
