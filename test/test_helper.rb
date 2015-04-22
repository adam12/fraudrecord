require 'simplecov'
if require 'coveralls'
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
    add_filter '/test/'
  end
end

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/vcr_cassettes'
  c.hook_into :webmock
end

require_relative '../lib/fraudrecord'

TEST_ENV = true

require 'rubygems'
gem "minitest"
require 'minitest/autorun'
