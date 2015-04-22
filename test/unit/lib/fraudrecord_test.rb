module Fraudrecord
  
  require_relative '../../test_helper'
  
  class FraudrecordTest < Minitest::Test
    def test_query
      VCR.use_cassette('standard_query') do
        value, count, reliability, _ = *Fraudrecord.query(name: "Bob Jones", email: 'bob@jones.co.uk')
        assert_equal 0, value
        assert_equal 0, count
        assert_equal 0.0, reliability
      end
    end
  end
end