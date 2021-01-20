require 'test_helper'

class MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mypage_new_url
    assert_response :success
  end

end
