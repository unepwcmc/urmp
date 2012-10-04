require 'spec_helper'

describe Resource do

  it { should validate_presence_of :resource_type}
  it { should ensure_inclusion_of(:resource_type).in_array(Resource::TYPES.keys) }
  it { should_not ensure_inclusion_of(:resource_type).in_array(%w[foo bar]) }

  it { should ensure_inclusion_of(:theme).in_array(Resource::THEMES) }
  it { should_not ensure_inclusion_of(:theme).in_array(%w[foo bar]) }

  describe 'THEMES' do
    it do
      Resource::THEMES.should == ['impacts', 'identification']
    end
  end

  describe 'TYPES' do
    it do
      Resource::TYPES.keys.should == ['tool', 'guidance', 'information_material']
    end
  end
end
