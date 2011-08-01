require 'test_helper'

class CriterionTest < ActiveSupport::TestCase
  test "Can get the description in multiple language" do
    I18n.locale = :en
    criterion = Factory.create(:criterion, :description => 'English description')
    #Add french translation
    I18n.locale = :fr
    criterion.description = 'Les description francais'
    
    #Test the descriptions
    I18n.locale = :en
    assert_equal 'English description', criterion.description

    I18n.locale = :fr
    assert_equal 'Les description francais', criterion.description

    #Reset the locale
    I18n.locale = :en
  end

  test "Criterion translations should be a visible association, for rails_admin" do
    I18n.locale = :en
    criterion = Factory.create(:criterion, :description => 'English description')
    #Add french translation
    I18n.locale = :fr
    criterion.description = 'Les description francais'
    criterion.save

    assert_equal 2, criterion.criterion_translations.count

    #Reset the locale
    I18n.locale = :en
  end
end
