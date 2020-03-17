require 'test_helper'

class EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_users_show_url
    assert_response :success
  end

end
