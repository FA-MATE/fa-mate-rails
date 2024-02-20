require "test_helper"

class ConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @condition = conditions(:one)
  end

  test "should get index" do
    get conditions_url, as: :json
    assert_response :success
  end

  test "should create condition" do
    assert_difference("Condition.count") do
      post conditions_url, params: { condition: { condition_group_id: @condition.condition_group_id, name: @condition.name, order_no: @condition.order_no } }, as: :json
    end

    assert_response :created
  end

  test "should show condition" do
    get condition_url(@condition), as: :json
    assert_response :success
  end

  test "should update condition" do
    patch condition_url(@condition), params: { condition: { condition_group_id: @condition.condition_group_id, name: @condition.name, order_no: @condition.order_no } }, as: :json
    assert_response :success
  end

  test "should destroy condition" do
    assert_difference("Condition.count", -1) do
      delete condition_url(@condition), as: :json
    end

    assert_response :no_content
  end
end
