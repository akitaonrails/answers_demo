require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe User do
  it "should create a new instance given valid attributes" do
    @user = Factory.build(:user)
    lambda { @user.save! }.should_not raise_error
  end

  it "should not create a new instance given invalid attributes" do
    @user = Factory.build(:user, :name => nil)
    lambda { @user.save! }.should raise_error
  end
end
