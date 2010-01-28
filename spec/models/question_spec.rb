require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Question do
  before(:each) do
    @product = Factory(:product)
    @user = Factory(:user)
  end

  it "should create a new instance given valid attributes" do
    @question = Factory.build(:question, :product => @product, :user => @user)
    lambda { @question.save! }.should_not raise_error
  end
  
  it "should not create a new instance without user" do
    @question = Factory.build(:question, :product => @product)
    lambda { @question.save! }.should raise_error    
  end

  it "should not create a new instance without product" do
    @question = Factory.build(:question, :user => @user)
    lambda { @question.save! }.should raise_error    
  end
end
