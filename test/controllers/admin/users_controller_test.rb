require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "should get index" do
    get admin_users_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_user_url
    assert_response :success
  end

  test "should get show" do
    get admin_user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_user_url(@user)
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post admin_users_url, params: {
        user: {
          name: "新規太郎",
          email: "new_user@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end
    assert_redirected_to admin_user_url(User.last)
  end

  test "should not create user with invalid params" do
    assert_no_difference("User.count") do
      post admin_users_url, params: { user: { name: "", email: "", password: "", password_confirmation: "" } }
    end
    assert_response :success
  end

  test "should update user without changing password" do
    patch admin_user_url(@user), params: { user: { name: "更新後の名前", email: @user.email } }
    assert_redirected_to admin_user_url(@user)
    assert_equal "更新後の名前", @user.reload.name
  end

  test "should not update user with invalid params" do
    patch admin_user_url(@user), params: { user: { name: "", email: @user.email } }
    assert_response :success
    assert_not_equal "", @user.reload.name
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete admin_user_url(@user)
    end
  end
end
