require 'spec_helper'
require 'googleauth'

describe GoogleSheetsAppendroid::Authorize do
  describe '#get_access_token' do

    before do
      GoogleSheetsAppendroid.configure do |config| 
        config.google_sheet_id = '12345'
      end
    end
    
    it 'should attempt to get_application_default google credentials' do
      pattern = /Could not load the default credentials/
      expect { described_class.get_access_token }
        .to raise_error(RuntimeError, pattern)
    end
  end
end
