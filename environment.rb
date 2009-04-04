require 'rubygems'
require 'couchrest'
require 'haml'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title       => 'Your Application Name',
                 :author      => 'Your Name',
                 :url_base    => 'http://localhost:4567/',
                 :url_base_db => 'http://localhost:5984/',
                 :db_name     => "sinatra-template-#{Sinatra::Base.environment}"
               )

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end
