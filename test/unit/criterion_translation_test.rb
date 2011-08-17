require 'test_helper'

class CriterionTranslationTest < ActiveSupport::TestCase

  test "Creates a relevant cached name on saving when linked to criterion" do
    @criterion = Factory.create(:criterion)

    @criterion_translation = Factory.create(:criterion_translation, :criterion => @criterion, :description => 'Hatboat', :locale => :en)
    assert_equal "Criterion #{@criterion.number} - en - Hatboat", @criterion_translation.name
  end
end
