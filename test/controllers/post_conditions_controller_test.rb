require "test_helper"

class PostConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_condition = post_conditions(:one)
  end

  test "should get index" do
    get post_conditions_url, as: :json
    assert_response :success
  end

  test "should create post_condition" do
    assert_difference("PostCondition.count") do
      post post_conditions_url, params: { post_condition: { condition_id: @post_condition.condition_id, post_id: @post_condition.post_id } }, as: :json
    end

    assert_response :created
  end

  test "should show post_condition" do
    get post_condition_url(@post_condition), as: :json
    assert_response :success
  end

  test "should update post_condition" do
    patch post_condition_url(@post_condition), params: { post_condition: { condition_id: @post_condition.condition_id, post_id: @post_condition.post_id } }, as: :json
    assert_response :success
  end

  test "should destroy post_condition" do
    assert_difference("PostCondition.count", -1) do
      delete post_condition_url(@post_condition), as: :json
    end

    assert_response :no_content
  end
end
