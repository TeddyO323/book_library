require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_one)  # Ensure user_one exists in test/fixtures/users.yml
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count', 1) do
      post users_path, params: { user: { email: "test@example.com", password: "password" } }
    end
    assert_redirected_to user_path(User.last) # Ensure redirection happens correctly
  end
  

  test "should show user" do
    puts "User ID: #{@user.id}"  # Debugging step to check if user exists
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: "updated@example.com" } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end
end
