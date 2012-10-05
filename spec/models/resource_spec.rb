require 'spec_helper'

describe Resource do

  it { should ensure_inclusion_of(:resource_type).in_array(Resource::TYPES.keys) }
  it { should_not ensure_inclusion_of(:resource_type).in_array(%w[foo bar]) }

  it { should ensure_inclusion_of(:theme).in_array(Resource::THEMES) }
  it { should_not ensure_inclusion_of(:theme).in_array(%w[foo bar]) }

  describe 'THEMES' do
    it do
      Resource::THEMES.should == ['impacts', 'identification']
    end
  end

  describe 'TYPES' do
    it do
      Resource::TYPES.keys.should == ['tool', 'guidance', 'information_material']
    end
  end

  describe '#picture' do
    let(:image_file) { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/test_image.jpg", "image/jpg") }
    let(:pdf_file) { test_pdf_file }

    it 'stores only images' do
      resource = build(:resource, :picture => image_file)
      resource.should be_valid
      resource.picture = pdf_file
      resource.should_not be_valid
    end

    it 'generates thumb, and medium image' do
      resource = build(:resource, :picture => image_file)

      resource.should be_valid
      resource.picture.url(:medium).should be_present
      resource.picture.url(:thumb).should be_present
    end
  end
end
