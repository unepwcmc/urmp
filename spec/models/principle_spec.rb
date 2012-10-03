require 'spec_helper'

describe Principle do
  it { should validate_presence_of :number }
  it { should validate_presence_of :description }
  it { should have_many :criteria }
end
