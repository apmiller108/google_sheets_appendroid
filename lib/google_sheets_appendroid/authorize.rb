require 'googleauth'
module GoogleSheetsAppendroid
  class Authorize

    def self.get_access_token
      scopes = GoogleSheetsAppendroid.configuration.scopes
      authorization = Google::Auth.get_application_default(scopes)
      authorization.fetch_access_token!['access_token']
    end
  end
end
