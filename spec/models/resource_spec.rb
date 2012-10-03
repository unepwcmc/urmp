require 'spec_helper'

describe Resource do

  it { should validate_presence_of :theme}
  it { should ensure_inclusion_of(:theme).in_array(Resource::THEMES) }

  describe 'THEMES' do
    it '' do
      Resource::THEMES.should == ['impacts', 'identification']
    end
  end
end
