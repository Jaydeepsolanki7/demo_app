require "test_helper"

class WelcomesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get welcomes_home_url
    assert_response :success
  end
end
