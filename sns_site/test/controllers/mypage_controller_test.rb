require "test_helper"

class MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mypage_show_url
    assert_response :success
  end

  test "should get edit" do
    get mypage_edit_url
    assert_response :success
  end

  test "should get update" do
    get mypage_update_url
    assert_response :success
  end
end
