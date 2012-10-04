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
    it 'gets all factsheets grouped by theme' do
      fail
    end
  end
end
