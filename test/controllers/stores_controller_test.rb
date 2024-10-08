require "test_helper"

class StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get –api" do
    get stores_–api_url
    assert_response :success
  end
end
