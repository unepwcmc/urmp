require 'spec_helper'

describe Resource do

  it { should validate_presence_of :theme}
  it { should validate_presence_of :resource_type}
  it { should ensure_inclusion_of(:theme).in_array(Resource::THEMES) }
  it { should ensure_inclusion_of(:theme).in_array(Resource::TYPES) }

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
