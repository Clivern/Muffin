require "test_helper"

class HealthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/_health"
    assert_response :success
    assert_equal '{"status":"ok"}', @response.body
    assert_equal 'application/json; charset=utf-8', @response.header["Content-Type"]
    assert_not_empty @response.header["X-Request-Id"]
  end
end
