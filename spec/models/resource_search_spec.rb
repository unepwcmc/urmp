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

    context 'when searching by language' do
      let(:language_to_find) { create(:language) }
      let(:other_language) { create(:language) }
      let(:resource_1) { create(:resource, :languages => [language_to_find]) }
      let(:resource_2) { create(:resource, :languages => [other_language, language_to_find]) }
      let(:resource_3) { create(:resource, :languages => [other_language]) }
      let(:attrs) do { 'languages' => language_to_find.id } end

      before { resource_1; resource_2; resource_3 }

      it 'looks by language' do
        resource_search.find.size.should == 2

        resource_search.results.should include (resource_1)
        resource_search.results.should include (resource_2)
        resource_search.results.should_not include (resource_3)
      end
    end

    context 'when searching by topic' do
      let(:topic_to_find) { create(:topic) }
      let(:other_topic) { create(:topic) }
      let(:resource_1) { create(:resource, :topics => [topic_to_find]) }
      let(:resource_2) { create(:resource, :topics => [other_topic, topic_to_find]) }
      let(:resource_3) { create(:resource, :topics => [other_topic]) }
      let(:attrs) do { 'topics' => topic_to_find.id } end

      before { resource_1; resource_2; resource_3 }

      it 'looks by topic' do
        resource_search.find.size.should == 2

        resource_search.results.should include (resource_1)
        resource_search.results.should include (resource_2)
        resource_search.results.should_not include (resource_3)
      end
    end

    context 'when searching by scale' do
      let(:scale_to_find) { create(:scale) }
      let(:other_scale) { create(:scale) }
      let(:resource_1) { create(:resource, :scales => [scale_to_find]) }
      let(:resource_2) { create(:resource, :scales => [other_scale, scale_to_find]) }
      let(:resource_3) { create(:resource, :scales => [other_scale]) }
      let(:attrs) do { 'scales' => scale_to_find.id } end

      before { resource_1; resource_2; resource_3 }

      it 'looks by scale' do
        resource_search.find.size.should == 2

        resource_search.results.should include (resource_1)
        resource_search.results.should include (resource_2)
        resource_search.results.should_not include (resource_3)
      end
    end

    context 'when searching by country' do
      let(:country_to_find) { create(:country) }
      let(:other_country) { create(:country) }
      let(:resource_1) { create(:resource, :countries => [country_to_find]) }
      let(:resource_2) { create(:resource, :countries => [other_country, country_to_find]) }
      let(:resource_3) { create(:resource, :countries => [other_country]) }
      let(:attrs) do { 'countries' => country_to_find.id } end

      before { resource_1; resource_2; resource_3 }

      it 'looks by country' do
        resource_search.find.size.should == 2

        resource_search.results.should include (resource_1)
        resource_search.results.should include (resource_2)
        resource_search.results.should_not include (resource_3)
      end
    end

    context 'when searching by redd_activity' do
      let(:redd_activity_to_find) { create(:redd_activity) }
      let(:other_redd_activity) { create(:redd_activity) }
      let(:resource_1) { create(:resource, :redd_activities => [redd_activity_to_find]) }
      let(:resource_2) { create(:resource, :redd_activities => [other_redd_activity, redd_activity_to_find]) }
      let(:resource_3) { create(:resource, :redd_activities => [other_redd_activity]) }
      let(:attrs) do { 'redd_activities' => redd_activity_to_find.id } end

      before { resource_1; resource_2; resource_3 }

      it 'looks by redd_activity' do
        resource_search.find.size.should == 2

        resource_search.results.should include (resource_1)
        resource_search.results.should include (resource_2)
        resource_search.results.should_not include (resource_3)
      end
    end
  end
end
