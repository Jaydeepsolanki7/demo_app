require "test_helper"

class BusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buses_index_url
    assert_response :success
  end

  test "should get new" do
    get buses_new_url
    assert_response :success
  end
end
