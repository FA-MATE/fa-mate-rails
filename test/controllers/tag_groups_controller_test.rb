require "test_helper"

class TagGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag_group = tag_groups(:one)
  end

  test "should get index" do
    get tag_groups_url, as: :json
    assert_response :success
  end

  test "should create tag_group" do
    assert_difference("TagGroup.count") do
      post tag_groups_url, params: { tag_group: { name: @tag_group.name, order_no: @tag_group.order_no } }, as: :json
    end

    assert_response :created
  end

  test "should show tag_group" do
    get tag_group_url(@tag_group), as: :json
    assert_response :success
  end

  test "should update tag_group" do
    patch tag_group_url(@tag_group), params: { tag_group: { name: @tag_group.name, order_no: @tag_group.order_no } }, as: :json
    assert_response :success
  end

  test "should destroy tag_group" do
    assert_difference("TagGroup.count", -1) do
      delete tag_group_url(@tag_group), as: :json
    end

    assert_response :no_content
  end
end
