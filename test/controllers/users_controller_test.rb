require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get create" do
    post users_path, params: {
      user: {
        email: "test3@example.com",
        password: "password",
        name: "Test User"
      }
    }
    assert_response :redirect
  end
end
