require 'test_helper'

class PrincipleTest < ActiveSupport::TestCase
  test "Can get the description in multiple language" do
    I18n.locale = :en
    principle = Factory.create(:principle, :description => 'English description')

    #Add french translation
    I18n.locale = :fr
    principle.description = 'Les description francais'
    
    #Test the descriptions
    I18n.locale = :en
    assert_equal 'English description', principle.description

    I18n.locale = :fr
    assert_equal 'Les description francais', principle.description

    #Reset the locale
    I18n.locale = :en
  end

  test "Principle translations should be a visible association, for rails_admin" do
    I18n.locale = :en
    principle = Factory.create(:principle, :description => 'English description')
    #Add french translation
    I18n.locale = :fr
    principle.description = 'Les description francais'

    assert_not_equal 2, principle.principle_translations.count
    #Reset the locale
    I18n.locale = :en
  end
end
