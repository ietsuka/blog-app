require 'test_helper'

class SettingControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get setting_new_url
    assert_response :success
  end

end
