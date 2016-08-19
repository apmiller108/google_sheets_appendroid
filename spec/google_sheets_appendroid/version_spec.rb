require 'spec_helper'

describe GoogleSheetsAppendroid do
  it 'should have a version number' do
    expect(described_class::VERSION).to match(/^\d\.\d\.\d$/)
  end
end
