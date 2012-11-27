require 'spec_helper'

describe 'Static Pages' do

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

  describe 'GET /assesments' do
    let(:path) { assesments_path }
    it_should_behave_like :succesful_page
  end

  describe 'GET /faq' do
    let(:path) { faq_path }
    it_should_behave_like :succesful_page
  end
end
