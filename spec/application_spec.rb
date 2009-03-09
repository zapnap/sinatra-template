require "#{File.dirname(__FILE__)}/spec_helper"

describe 'main application' do
  include Sinatra::Test

  specify 'should show the default index page' do
    get '/'
    @response.should be_ok
    @response.body.should match(/Main Page/)
  end

  specify 'should have more specs' do
    pending
  end
end
