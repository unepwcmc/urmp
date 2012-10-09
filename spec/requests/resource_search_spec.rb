require 'spec_helper'

describe 'Search' do

  describe 'GET /search' do
    let(:path) { search_path }
    it_should_behave_like :succesful_page
  end

  describe 'GET /search_results' do
    let(:path) { search_results_path }
    it_should_behave_like :succesful_page
  end

  describe 'search' do
    let(:resource_1) { create(:resource, :title => 'foo biz')}
    let(:resource_2) { create(:resource, :title => 'bar')}

    it 'finds searched results' do
      visit search_path
      fill_in "search_text", :with => resource_1.title

      click_on 'Search'

      within '.results' do
        page.should have_content resource_1.title
        page.should have_content resource_1.description

        page.should_not have_content resource_2.title
      end
    end
  end

end
