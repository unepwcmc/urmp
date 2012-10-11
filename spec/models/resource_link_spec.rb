require 'spec_helper'

describe ResourceLink do

  it { should validate_presence_of :resource }
  it { should validate_presence_of :criterion }

  describe 'stores cached name' do
    let(:resource_link) { build(:resource_link) }

    context 'when there validation not pass' do
      let(:resource_link) { build(:resource_link, :resource => nil) }

      it 'doesn\'t save cached_name' do
        resource_link.cached_name.should be_blank
        resource_link.save
        resource_link.cached_name.should be_blank
      end
    end

    context 'when reference present' do
      before do
        resource_link.reference = 'reference foo'
      end

      it 'creates store_cache_name in before save hook' do
        resource_link.cached_name.should be_blank
        resource_link.save
        resource_link.cached_name.should ==
          "#{resource_link.reference} - #{resource_link.resource.title} - #{resource_link.criterion.name}"

      end
    end

    context 'when no reference' do
      it 'creates store_cache_name in before save hook' do
        resource_link.cached_name.should be_blank
        resource_link.save
        resource_link.cached_name.should ==
          "#{resource_link.resource.title} - #{resource_link.criterion.name}"
      end
    end
  end
end
