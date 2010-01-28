require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Product do

  it "should not create a new instance given valid attributes" do
    lambda { Product.create! }.should raise_error
  end
  
  it "should create a new instance given valid attributes" do
    lambda { Product.create!(:name => "Foo") }.should_not raise_error
  end
end
