require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)
require 'sinatra'
require 'rspec'
require 'rack/test'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require File.join(File.dirname(__FILE__), '../application')

# establish in-memory database for testing
DataMapper.setup(:default, "sqlite3::memory:")

RSpec.configure do |config|
  # reset database before each example is run
  config.before(:each) { DataMapper.auto_migrate! }
end
