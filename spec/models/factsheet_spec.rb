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
      let!(:factsheet_1) {
        create(:factsheet, :resource => create(:resource, :theme => Resource::THEMES.first ))
      }

      let!(:factsheet_2) {
        create(:factsheet, :resource => create(:resource, :theme => Resource::THEMES.last ))
      }

      it 'gets factsheets grouped by theme' do
        results = Factsheet.grouped_by_resource_theme

        Resource::THEMES.each do |theme|
          results[theme].should be_present
        end
      end
    end

    context "when there are factsheets withouth theme" do
      let!(:factsheet_1) {
        create(:factsheet, :resource => create(:resource, :theme => Resource::THEMES.first ))
      }

      let!(:factsheet_1) {
        create(:factsheet, :resource => create(:resource, :theme => nil ))
      }

      it 'gets factsheets grouped by theme' do
        results = Factsheet.grouped_by_resource_theme
        results[nil].should == [factsheet_1]
      end
    end
  end
end
