require 'test_helper'

class PrincipleTranslationTest < ActiveSupport::TestCase

  test "Creates a relevant cached name on saving when linked to principle" do
    @principle = Factory.create(:principle)

    @principle_translation = Factory.create(:principle_translation, :principle => @principle, :description => 'Hatboat', :locale => :en)
    assert_equal "Principle #{@principle.number} - en - Hatboat", @principle_translation.cached_name
  end
end
