require 'test_helper'

class ResourceLinkTest < ActiveSupport::TestCase

=begin Cannot be linked to a principle anymore
  
  test "Creates a relevant cached name on saving when linked to principle" do
    @resource = Factory.create(:resource, :title => "hat")
    @principle = Factory.create(:principle)

    @link = Factory.create(:resource_link, :resource => @resource, :principle => @principle, :reference => 'Chapter 5')
    assert "Chapter 5 - hat - principle #{@principle.number}", @link.cached_name
  end
=end

  test "Creates a relevant cached name on saving when linked to criterion" do
    @resource = Factory.create(:resource, :title => "hat")
    @criterion = Factory.create(:criterion)

    @link = Factory.create(:resource_link, :resource => @resource, :criterion => @criterion, :reference => 'Chapter 5')
    assert_equal "Chapter 5 - hat - criterion #{@criterion.number}", @link.cached_name
  end
end
