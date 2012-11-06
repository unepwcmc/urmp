require 'spec_helper'

describe Factsheet do

  it { should validate_presence_of :name}
  it { should validate_presence_of :resource}
  it { should validate_presence_of :attachment }
  it { should belong_to :resource }

  describe "#attachment" do
    let(:pdf_file) { test_pdf_file }
    let(:image) { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/test_image.jpg", "image/jpg") }

    it 'stores only pdf' do
      factsheet = build(:factsheet, :attachment => image)
      factsheet.should_not be_valid
      factsheet.attachment = pdf_file
      factsheet.should be_valid
    end
  end

  describe "#grouped_by_resource_theme" do
    context "when all factsheets belongs to resource with theme" do
      let(:topic_1) {create(:topic, name: 'topic 1')}
      let!(:factsheet_1) {
        create(:factsheet, :resource => create(:resource, :topics => [
                                                                      topic_1,
                                                                      create(:topic, name: 'topic 2')
                                                                    ]))
      }

      let!(:factsheet_2) {
        create(:factsheet, :resource => create(:resource, :topics => [
                                                             topic_1,
                                                             create(:topic, name: 'topic 3')
                                                            ]))
      }

      it 'gets factsheets grouped by theme' do
        results = Factsheet.grouped_by_resource_topic
        
        results['topic 1'].should be_present
        results['topic 2'].should be_present
        results['topic 3'].should be_present
        results['topic 4'].should_not be_present

        results['topic 1'].length.should eq(2)
        results['topic 2'].length.should eq(1)
      end
    end

    context "when there are factsheets without theme" do
      let!(:factsheet_1) {
        create(:factsheet, :resource => create(:resource, :topics => [create(:topic)]))
      }

      let!(:factsheet_1) {
        create(:factsheet, :resource => create(:resource, :topics => []))
      }

      it 'gets factsheets grouped by theme' do
        results = Factsheet.grouped_by_resource_topic
        results[nil].should == [factsheet_1]
      end
    end
  end
end
