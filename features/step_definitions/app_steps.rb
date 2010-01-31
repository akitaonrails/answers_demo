Given /^(?:|I )have a (.+)$/ do |model_name|
  model_name = model_name.underscore.singularize.to_sym
  case model_name
  when :user
    @user = Factory(:user)
    @user.memberships.create(:product => Product.first)
  when :question
    Factory(:question, :product => Product.first, :user => User.first)
  else
    Factory(model_name)
  end
end

Then /^(?:|I )follow redirect$/ do
  follow_redirect!
end

Given /^I am authenticated$/ do
  if User.count == 0
    @user = Factory(:user)
    @product = Product.first
    @user
  end
  visit path_to("the home page")
  click_link("Sign In")
  fill_in("user[email]", :with => "johndoe@gmail.com")
  fill_in("user[password]", :with => "john123")
  click_button("Sign in")
end
