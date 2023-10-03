require "test_helper"

class SeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seats_index_url
    assert_response :success
  end
end
