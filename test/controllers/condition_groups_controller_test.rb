require "test_helper"

class ConditionGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @condition_group = condition_groups(:one)
  end

  test "should get index" do
    get condition_groups_url, as: :json
    assert_response :success
  end

  test "should create condition_group" do
    assert_difference("ConditionGroup.count") do
      post condition_groups_url, params: { condition_group: { name: @condition_group.name, order_no: @condition_group.order_no } }, as: :json
    end

    assert_response :created
  end

  test "should show condition_group" do
    get condition_group_url(@condition_group), as: :json
    assert_response :success
  end

  test "should update condition_group" do
    patch condition_group_url(@condition_group), params: { condition_group: { name: @condition_group.name, order_no: @condition_group.order_no } }, as: :json
    assert_response :success
  end

  test "should destroy condition_group" do
    assert_difference("ConditionGroup.count", -1) do
      delete condition_group_url(@condition_group), as: :json
    end

    assert_response :no_content
  end
end
