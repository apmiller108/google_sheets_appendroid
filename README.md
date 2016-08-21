[![Build
Status](https://travis-ci.org/apmiller108/google_sheets_appendroid.svg?branch=master)](https://travis-ci.org/apmiller108/google_sheets_appendroid)
# Google Sheets Appendroid

Append rows to a Google Sheet spreadsheet.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_sheets_appendroid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_sheets_appendroid

## Overview

This library uses the
[google-auth-library-ruby](https://github.com/google/google-auth-library-ruby)
in order to take advantage of [Application Default Credentials](https://developers.google.com/identity/protocols/application-default-credentials).  This makes
getting credentials for calling Google APIs quite simple.

Also, this library is designed for use in server-to-server interactions and
therefore requires a [Google Service
Account](https://developers.google.com/identity/protocols/OAuth2ServiceAccount).
Follow the instructions
[here](https://developers.google.com/identity/protocols/OAuth2ServiceAccount)
for setting one up.  It's easy.

Lastly, using Application Defualt Credentials via [google-auth-library-ruby](https://github.com/google/google-auth-library-ruby) requires that you set an environment variable `GOOGLE_APPLICATION_CREDENTIALS` that points to the location of your credentials file exported from your Google Service Account. You can read more about this [here](https://developers.google.com/identity/protocols/application-default-credentials). 

Note: this uses Google Sheets API v4.
## Usage

Configure with a `sheet_id`.  In Rails, this can go in an initializer.

```ruby
GoogleSheetsAppendroid.configure do |config| 
  config.sheet_id = '12345'
end
```

Append some rows to your sheet by passing in rows in the form of a two
dimensional array and a range in [A1 notation](https://developers.google.com/sheets/guides/concepts#a1_notation).  In this example, two rows will be appended after the last rows on the sheet.  

```ruby
rows  = [['one', 'two'], ['three', 'four']]
range = 'My Sheet!A1'

GoogleSheetsAppendroid.append(rows, range)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/google_sheets_appendroid.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

