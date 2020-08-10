require "test_helper"

class OptionControllerTest < ActionDispatch::IntegrationTest
  test "should get options" do
    get "/option"

    assert_response :success
    assert_not_empty @response.body
    assert_equal 'application/json; charset=utf-8', @response.header["Content-Type"]
    assert_not_empty @response.header["X-Request-Id"]
  end

  test "should create an option" do
    post "/option", params: {key: "key08", value: "value08", autoload: false}.to_json, headers: {'Content-Type' => 'application/json'}

    assert_response :success
    assert_not_empty @response.body
    assert_equal 'application/json; charset=utf-8', @response.header["Content-Type"]
    assert_not_empty @response.header["X-Request-Id"]
  end

  test "should update an option" do
    put "/option/key01", params: {value: "Value08", autoload: true}.to_json, headers: {'Content-Type' => 'application/json'}

    assert_response :success
    assert_not_empty @response.body
    assert_equal 'application/json; charset=utf-8', @response.header["Content-Type"]
    assert_not_empty @response.header["X-Request-Id"]
  end

  test "should get an option" do
    get "/option/key01"

    assert_response :success
    assert_not_empty @response.body
    assert_equal 'application/json; charset=utf-8', @response.header["Content-Type"]
    assert_not_empty @response.header["X-Request-Id"]
  end

  test "should delete an option" do
    delete "/option/key01"

    assert_response :success
    assert_empty @response.body
    assert_not_empty @response.header["X-Request-Id"]
  end
end
