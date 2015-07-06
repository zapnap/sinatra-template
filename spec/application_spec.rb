require "#{File.dirname(__FILE__)}/spec_helper"

describe 'main application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  it 'shows the default index page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'should have more specs'
end
