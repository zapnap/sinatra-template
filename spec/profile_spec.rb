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

  specify 'should be saved' do
    @profile.save
    Profile.get(@profile.id).name.should == @profile.name
  end

  specify 'should retrieve entries by name' do
    @profile.save
    Profile.by_name.length.should == 1
    Profile.by_name[0].name.should == @profile.name
  end
end
