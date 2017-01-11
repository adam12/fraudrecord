Gem::Specification.new do |gem|
  gem.name = 'fraudrecord'
  gem.version = '0.0.1'
  gem.date = '2015-04-22'
  gem.summary = 'fraudrecord'
  gem.description = 'API wrapper for FraudRecord.com'
  gem.authors = [ 'Sean Handley' ]
  gem.email = 'sean.handley@gmail.com'
  gem.files = `git ls-files`.split("\n")
  gem.homepage = 'https://github.com/seanhandley/fraudrecord'
  gem.license = 'MIT'
  
  gem.required_ruby_version = '> 2.0.0'
  
  # Runtime Dependencies
  gem.add_runtime_dependency 'faraday', '~> 0.9.0'
  gem.add_runtime_dependency 'activesupport', '>= 4.2.0'
  
  # Development Dependencies
  gem.add_development_dependency 'vcr', '~> 2.8.0'
  gem.add_development_dependency 'webmock', '~> 1.8.0'
  gem.add_development_dependency 'minitest', '~> 5.3.1'
  gem.add_development_dependency 'simplecov', '~> 0.8.2'
  gem.add_development_dependency 'coveralls', '~> 0.7.0'
  gem.add_development_dependency 'rake'

end
