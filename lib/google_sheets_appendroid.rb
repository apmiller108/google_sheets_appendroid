require 'google_sheets_appendroid/version'
require 'google_sheets_appendroid/configuration'
require 'google_sheets_appendroid/append_rows'
require 'google_sheets_appendroid/authorize'

module GoogleSheetsAppendroid

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration if block_given?
  end

  def self.append(rows, range)
    AppendRows.new(rows, range).punch_it
  end
end
