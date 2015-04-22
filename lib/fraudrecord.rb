require 'faraday'
require 'active_support'
require 'active_support/core_ext'
require 'digest/sha1'

module Fraudrecord
  def self.query(args={})
    processed_args = process_args(args).merge!('_action' => 'query',
                                            '_api'    => ENV["FRAUD_RECORD_API_KEY"])
    response = conn.get '/api/', processed_args
    Hash.from_xml(response.body)['report'].split('-').collect(&:to_f)
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