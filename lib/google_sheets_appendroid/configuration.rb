module GoogleSheetsAppendroid
  class Configuration
    attr_reader :scopes
    attr_accessor :google_sheet_id

    def initialize
      @scopes = ['https://www.googleapis.com/auth/spreadsheets']
    end
  end
end
