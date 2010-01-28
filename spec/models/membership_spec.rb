require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Membership do
  before(:each) do
    @user = Factory(:user)
    @product = Factory(:product)
  end

  it "should create a new instance given valid attributes" do
    lambda { Membership.create!(:user => @user, :product => @product) }.
      should_not raise_error
  end
  
  it "should not create a new instance given invalid attributes" do
    lambda { Membership.create! }.should raise_error
  end
end
