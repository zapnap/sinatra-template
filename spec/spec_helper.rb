require 'rubygems'
require 'sinatra'
require 'spec'
require 'spec/interop/test'
require 'rack/test'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require 'application'

Spec::Runner.configure do |config|
  config.before(:each) do
    begin
      CouchRest.delete((SiteConfig.url_base_db || '') + SiteConfig.db_name)
    rescue RestClient::ResourceNotFound
    ensure
      CouchRest.database!((SiteConfig.url_base_db || '') + SiteConfig.db_name)
    end
  end
end
