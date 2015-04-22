require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
namespace :test do
  Rake::TestTask.new("unit") do |t|
    t.libs << 'test'
    t.pattern = "#{File.dirname(__FILE__)}/test/all.rb"
  end
end

desc "Run tests"
task :test => ["test:unit"]

task :default => :test