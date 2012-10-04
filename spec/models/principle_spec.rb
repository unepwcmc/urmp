require 'spec_helper'

describe Principle do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should have_many :criteria }
end
