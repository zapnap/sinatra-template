require 'rubygems'
require 'sinatra'
require 'sinatra/test/rspec'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

require 'application'

# establish in-memory database for testing
DataMapper.setup(:default, "sqlite3::memory:")

Spec::Runner.configure do |config|
  # reset database before each example is run
  config.before(:each) { DataMapper.auto_migrate! }
end
