require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get inedx" do
    get :inedx
    assert_response :success
  end

end
