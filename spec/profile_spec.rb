require "#{File.dirname(__FILE__)}/spec_helper"

describe 'profile' do
  before(:each) do
    @profile = Profile.new(:name => 'test user')
  end

  it 'is valid' do
    expect(@profile).to be_valid
  end

  it 'it requires a name' do
    @profile = Profile.new
    expect(@profile).to_not be_valid
    expect(@profile.errors[:name]).to include("Name must not be blank")
  end
end
