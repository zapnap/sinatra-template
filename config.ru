require 'application'

set :run, false
set :environment, :production

run Sinatra.application
