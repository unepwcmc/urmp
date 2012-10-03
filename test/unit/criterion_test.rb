require 'test_helper'

class CriterionTest < ActiveSupport::TestCase
  test "Can get the description" do
    criterion = Factory.create(:criterion, :description => 'English description')
    assert_equal 'English description', criterion.description
  end
end
