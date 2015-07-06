require "rubygems"
require "bundler/setup"
require "sinatra"
require "logger"
require File.join(File.dirname(__FILE__), "environment")

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  set :show_exceptions, :after_handler
end

configure :production, :development do
  enable :logging
end

helpers do
  # add your helpers here
end

# root page
get "/" do
  logger.info "logger"
  @profiles = Profile.all
  erb :root
end
