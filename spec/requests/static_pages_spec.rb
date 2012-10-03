require 'spec_helper'

describe 'Static Pages' do

  shared_examples_for :succesful_page do
    it 'responds with 200' do
      visit path
      page.status_code.should == 200
    end
  end

  describe 'GET root' do
    let(:path) { root_path }
    it_should_behave_like :succesful_page
  end

  describe 'GET /factsheets' do
    let(:path) { factsheets_path }
    it_should_behave_like :succesful_page
  end

  describe 'GET /monitoring' do
    let(:path) { monitoring_path }
    it_should_behave_like :succesful_page
  end

  describe 'GET /safeguards' do
    let(:path) { safeguards_path }
    it_should_behave_like :succesful_page
  end

  describe 'GET /mapping' do
    let(:path) { mapping_path }
    it_should_behave_like :succesful_page
  end

  describe 'GET /faq' do
    let(:path) { faq_path }
    it_should_behave_like :succesful_page
  end
end
