require File.join(File.dirname(__FILE__), 'application')

set :run, false
set :environment, :production

run Sinatra::Application
