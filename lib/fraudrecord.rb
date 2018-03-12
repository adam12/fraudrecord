require 'faraday'
require 'digest/sha1'
require 'rexml/document'

module Fraudrecord
  def self.query(args={})
    raise(ArgumentError, "Env variable FRAUD_RECORD_API_KEY not set") unless ENV["FRAUD_RECORD_API_KEY"]
    processed_args = process_args(args).merge!('_action' => 'query',
                                            '_api'    => ENV["FRAUD_RECORD_API_KEY"])
    response = conn.get '/api/', processed_args


    doc = REXML::Document.new(response.body)
    value, count, reliability, report = doc.get_elements('report').first.text.split('-')

    {
      value: value.to_i,
      count: count.to_i,
      reliability: reliability.to_f,
      report: "https://www.fraudrecord.com/api/?showreport=#{report}"
    }
  end

  private

  def self.default_host
    "https://www.fraudrecord.com"
  end

  def self.conn
    Faraday.new(:url => default_host, ssl: { verify: false }) do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.process_args(args)
    args.inject({}) do |acc, v|
      acc[v[0]] = salt_and_hash(v[1].gsub(/\s/,'').downcase)
      acc
    end
  end

  def self.salt_and_hash(value)
    32_000.times do
      value = Digest::SHA1.hexdigest("fraudrecord-#{value}")
    end
    value
  end
end