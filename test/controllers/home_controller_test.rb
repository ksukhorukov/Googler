require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get home" do
    get :index
    assert_response :success
    assert_select "title", "The Googler"
  end

end
