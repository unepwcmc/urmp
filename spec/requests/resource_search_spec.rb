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

end
