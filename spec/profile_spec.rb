require "#{File.dirname(__FILE__)}/spec_helper"

describe 'profile' do
  before(:each) do
    @profile = Profile.new(:name => 'test user')
  end

  specify 'should be valid' do
    @profile.should be_valid
  end

  specify 'should require a name' do
    @profile = Profile.new
    @profile.should_not be_valid
    @profile.errors[:name].should include("Name must not be blank")
  end
end
