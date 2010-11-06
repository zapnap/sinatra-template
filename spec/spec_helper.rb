require 'rubygems'
require 'bundler/setup'
require 'sinatra'
if RUBY_VERSION && RUBY_VERSION =~ /1.9/ then
  require 'rspec'
else
  require 'spec'
  require 'spec/interop/test'
end
require 'rack/test'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require File.join(File.dirname(__FILE__), '../application')
#require_relative 'application'

# establish in-memory database for testing
DataMapper.setup(:default, "sqlite3::memory:")
if RUBY_VERSION && RUBY_VERSION =~ /1.9/ then
  Rspec.configure do |c|
    c.before(:each) { DataMapper.auto_migrate! }
    #c.mock_with :rspec
  end
else
  Spec::Runner.configure do |config|
    # reset database before each example is run
    config.before(:each) { DataMapper.auto_migrate! }
  end
end


