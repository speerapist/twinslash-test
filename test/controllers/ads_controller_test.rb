require 'test_helper'

class AdsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get ads_home_url
    assert_response :success
  end

end
