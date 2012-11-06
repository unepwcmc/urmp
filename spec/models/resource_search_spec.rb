require 'spec_helper'

describe ResourceSearch do
  describe '#find' do
    let(:resource_search) { ResourceSearch.new(attrs)}

    context 'when searching by text' do
      let(:text) { 'foo' }
      let(:resource_1) { create(:resource, :title => text) }
      let(:resource_2) { create(:resource, :description => text) }
      let(:resource_3) { create(:resource)}
      let(:attrs) do { 'text' => text } end

      before { resource_1; resource_2; resource_3 }

      it 'looks in title and description' do
        resource_search.find.size.should == 2

        resource_search.results.should include (resource_1)
        resource_search.results.should include (resource_2)
        resource_search.results.should_not include (resource_3)
      end
    end

    context 'when searching by theme' do
      let(:theme) { Resource::THEMES.last }
      let(:resource_1) { create(:resource, :theme => theme) }
      let(:resource_2) { create(:resource, :theme => Resource::THEMES.first) }
      let(:attrs) do { 'theme' => theme } end

      before { resource_1; resource_2 }

      it 'looks by resource theme' do
        resource_search.find.size.should == 1

        resource_search.results.should include (resource_1)
        resource_search.results.should_not include (resource_2)
      end
    end

    context 'when searching by language' do
      let(:language) { 'English' }
      let(:resource_1) { create(:resource, :language => language) }
      let(:resource_2) { create(:resource, :language => 'Spanish') }
      let(:attrs) do { 'language' => language } end

      before { resource_1; resource_2 }

      it 'looks by language' do
        resource_search.find.size.should == 1

        resource_search.results.should include (resource_1)
        resource_search.results.should_not include (resource_2)
      end
    end

    context 'when searching by resource_type' do
      let(:resource_type) { create(:resource_type) }
      let(:resource_type_last) { create(:resource_type) }
      let(:resource_1) { create(:resource, :resource_types => [resource_type]) }
      let(:resource_2) { create(:resource, :resource_types => [resource_type_last]) }
      let(:attrs) do { 'resource_types' => resource_type.id } end

      before { resource_1; resource_2 }

      it 'looks by resource_type' do
        resource_search.find.size.should == 1

        resource_search.results.should include (resource_1)
        resource_search.results.should_not include (resource_2)
      end
    end
  end
end
