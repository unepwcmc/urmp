require 'spec_helper'

describe 'Search' do

  describe 'GET /search' do
    let(:path) { search_path }
    it_should_behave_like :succesful_page
  end

end
