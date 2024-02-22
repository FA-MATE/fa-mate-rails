require "test_helper"

class UserConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_condition = user_conditions(:one)
  end

  test "should get index" do
    get user_conditions_url, as: :json
    assert_response :success
  end

  test "should create user_condition" do
    assert_difference("UserCondition.count") do
      post user_conditions_url, params: { user_condition: { condition_id: @user_condition.condition_id, user_id: @user_condition.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_condition" do
    get user_condition_url(@user_condition), as: :json
    assert_response :success
  end

  test "should update user_condition" do
    patch user_condition_url(@user_condition), params: { user_condition: { condition_id: @user_condition.condition_id, user_id: @user_condition.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_condition" do
    assert_difference("UserCondition.count", -1) do
      delete user_condition_url(@user_condition), as: :json
    end

    assert_response :no_content
  end
end
