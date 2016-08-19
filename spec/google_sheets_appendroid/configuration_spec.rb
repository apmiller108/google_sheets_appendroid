require 'spec_helper'

describe GoogleSheetsAppendroid do
  context 'configured with a config block' do
    before do
      GoogleSheetsAppendroid.configure do |config| 
        config.google_sheet_id = '12345'
      end
    end

    it 'should have a scope array' do 
      expect(described_class.configuration.scopes).to be_instance_of(Array)
    end

    it 'should have a scope for spreadsheets' do
      expect(described_class.configuration.scopes).to include(
        'https://www.googleapis.com/auth/spreadsheets')
    end
  end
end
