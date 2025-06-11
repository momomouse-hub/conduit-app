require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signin_url
    assert_response :success
  end

  test "should log in user with valid credentials" do
    user = User.create!(email: "test3@example.com", password: "password", name: "Test")
    post signin_url, params: {
      email: user.email,
      password: "password"
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should get destroy" do
    delete signout_url
    assert_response :redirect
  end
end
