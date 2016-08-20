require 'net/http'

module GoogleSheetsAppendroid
  class AppendRows

    attr_reader :rows, :access_token, :range

    def initialize(rows, range)
      @access_token = Authorize.get_access_token
      @rows         = rows
      @range        = range
    end

    def punch_it
      req = create_request
      Net::HTTP.start(
        uri.hostname,
        uri.port,
        use_ssl: uri.scheme == 'https'
      ) { |http| http.request(req) } 
    end

    protected

    def create_request
      req = Net::HTTP::Post.new(uri)
      req['Content-Type'] = 'application/json'
      req['Authorization'] = "Bearer #{access_token}"
      req.body = value_range_object
      req
    end

    def uri
      sheet_id = GoogleSheetsAppendroid.configuration.sheet_id
      uri = "https://sheets.googleapis.com/v4/spreadsheets/#{sheet_id}/"\
        "values/#{range}:append?valueInputOption=USER_ENTERED"
      encoded_uri = URI.encode(uri)
      URI encoded_uri
    end

    def value_range_object
      JSON.generate({ range: range,
                      majorDimension: "ROWS",
                      values: rows })
    end
  end
end
