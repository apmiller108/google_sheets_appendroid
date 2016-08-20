require 'spec_helper'
require 'delegate'

rows = [['one', 'two'], ['three', 'four']]

class AppendRows < DelegateClass(GoogleSheetsAppendroid::AppendRows)
  def punch_it
    create_request
  end
end

describe GoogleSheetsAppendroid::AppendRows do

  subject(:appender) do 
    GoogleSheetsAppendroid::Authorize.stub(:get_access_token) { 'FAKE_TOKEN' }
    appender = described_class.new(rows, 'My Sheet!A2')
    AppendRows.new(appender)
  end

  it 'has rows, a range and access_token' do
    expect(appender.rows).to eq(rows)
    expect(appender.range).to match(/^My Sheet!A2$/)
    expect(appender.access_token).to match(/^FAKE_TOKEN$/)
  end

  it 'does a POST request with JSON as content type' do
    GoogleSheetsAppendroid.configuration.stub(:sheet_id) { 'FAKE_ID' }
    
    request = appender.punch_it

    expect(request).to be_instance_of(Net::HTTP::Post)
    expect(request['Content-Type']).to match(/^application\/json$/)
  end

  it 'sets an authorization header with bearer token' do
    GoogleSheetsAppendroid.configuration.stub(:sheet_id) { 'FAKE_ID' }
    
    request = appender.punch_it

    expect(request['Authorization']).to match(/^Bearer FAKE_TOKEN$/)
  end

  it 'properly sets and encodes the uri' do
    uri = "https://sheets.googleapis.com/v4/spreadsheets/FAKE_ID/values/My%20"\
      "Sheet!A2:append?valueInputOption=USER_ENTERED"
    GoogleSheetsAppendroid.configuration.stub(:sheet_id) { 'FAKE_ID' }

    request = appender.punch_it

    expect(request.uri.to_s).to eq(uri)
  end

  it 'creates a value range object' do
    GoogleSheetsAppendroid.configuration.stub(:sheet_id) { 'FAKE_ID' }

    body = JSON.parse(appender.punch_it.body)

    expect(body).to include('values' => rows)
    expect(body).to include('range' => 'My Sheet!A2')
    expect(body).to include('majorDimension' => 'ROWS')
  end
end

