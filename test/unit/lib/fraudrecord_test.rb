module Fraudrecord
  
  require_relative '../../test_helper'
  
  class FraudrecordTest < Minitest::Test
    def test_query
      VCR.use_cassette('standard_query') do
        results = Fraudrecord.query(name: "Bob Jones", email: 'bob@jones.co.uk')
        assert_equal 0,   results[:value]
        assert_equal 0,   results[:count]
        assert_equal 0.0, results[:reliability]
      end
    end
  end
end