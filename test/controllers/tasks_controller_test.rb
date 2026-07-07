require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @task = tasks(:one)
    log_in_as(@user)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get show" do
    get task_url(@task)
    assert_response :success
    assert_select "a[href='https://example.com']", text: "https://example.com"
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end
end
