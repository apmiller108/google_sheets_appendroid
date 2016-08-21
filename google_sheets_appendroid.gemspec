# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_sheets_appendroid/version'

Gem::Specification.new do |spec|
  spec.name          = "google_sheets_appendroid"
  spec.version       = GoogleSheetsAppendroid::VERSION
  spec.authors       = ["Alex Miller"]
  spec.email         = ["apmiller108@yahoo.com"]

  spec.summary       = %q{Apppend rows to a Google Sheets spreadsheet}
  spec.description   = %q{Apppend rows to a Google Sheets spreadsheet. Uses Google Sheets API v4 with server-to-server authentication}
  spec.homepage      = "https://github.com/apmiller108/google_sheets_appendroid"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'googleauth', '~> 0.5.1'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'pry'
end
