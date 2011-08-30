require 'test_helper'

class PrinciplesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns :principles
  end

end
