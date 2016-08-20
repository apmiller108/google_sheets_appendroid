module GoogleSheetsAppendroid
  class Configuration
    attr_reader :scopes
    attr_accessor :sheet_id

    def initialize
      @scopes = ['https://www.googleapis.com/auth/spreadsheets']
    end
  end
end
