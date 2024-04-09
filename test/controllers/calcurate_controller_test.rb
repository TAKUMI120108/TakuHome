require "test_helper"

class CalcurateControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get calcurate_new_url
    assert_response :success
  end
end
