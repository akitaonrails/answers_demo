require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Answer do
  before(:each) do
    @product = Factory(:product)
    @user = Factory(:user)
    @question = Factory.create(:question, :product => @product, :user => @user)
  end

  it "should create a new instance given valid attributes" do
    @answer = Answer.new(Factory.attributes_for(:answer, :question => @question, :user => @user))
    lambda { @answer.save! }.should_not raise_error
  end

  it "should not create a new instance without a question" do
    @answer = Answer.new(Factory.attributes_for(:answer, :user => @user))
    lambda { @answer.save! }.should_not raise_error
  end

  it "should not create a new instance without a user" do
    @answer = Answer.new(Factory.attributes_for(:answer, :question => @question))
    lambda { @answer.save! }.should_not raise_error
  end
end
