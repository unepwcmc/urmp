require 'test_helper'

class CriteriaControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, :id => Factory.create(:criterion).id
    assert_response :success
    assert_not_nil assigns :criterion
    assert_not_nil assigns :resource_links
  end

end
