require 'spec_helper'

describe 'Resource' do

  describe 'GET /resource/:id' do
    let(:resource) {create(:resource) }

    it 'displays information about resource' do
      visit resource_path(resource)

      page.should have_content resource.title
      page.should have_content resource.description
      page.should have_content resource.languages.map(&:name).join(',')
      page.should have_content resource.institution
      page.should have_selector 'a.external_link'
    end
  end
end
