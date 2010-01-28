require 'test/test_helper'

class LockTest < ActionController::IntegrationTest
  
  def visit_user_unlock_with_token(unlock_token)
    visit user_unlock_path(:unlock_token => unlock_token)
  end

  test 'user should be able to request a new unlock token' do
    user = create_user(:locked => true)
    ActionMailer::Base.deliveries.clear

    visit new_user_session_path
    click_link 'Didn\'t receive unlock instructions?'

    fill_in 'email', :with => user.email
    click_button 'Resend unlock instructions'

    assert_template 'sessions/new'
    assert_contain 'You will receive an email with instructions about how to unlock your account in a few minutes'
    assert_equal 1, ActionMailer::Base.deliveries.size
  end

  test 'unlocked user should not be able to request a unlock token' do
    user = create_user(:locked => false)
    ActionMailer::Base.deliveries.clear

    visit new_user_session_path
    click_link 'Didn\'t receive unlock instructions?'

    fill_in 'email', :with => user.email
    click_button 'Resend unlock instructions'

    assert_template 'unlocks/new'
    assert_contain 'not locked'
    assert_equal 0, ActionMailer::Base.deliveries.size
  end

  test 'user with invalid unlock token should not be able to unlock an account' do
    visit_user_unlock_with_token('invalid_token')

    assert_response :success
    assert_template 'unlocks/new'
    assert_have_selector '#errorExplanation'
    assert_contain /Unlock token(.*)invalid/
  end

  test "locked user should be able to unlock account" do
    user = create_user(:locked => true)
    assert user.locked?

    visit_user_unlock_with_token(user.unlock_token)

    assert_template 'home/index'
    assert_contain 'Your account was successfully unlocked.'

    assert_not user.reload.locked?
  end

  test "sign in user automatically after unlocking it's account" do
    user = create_user(:locked => true)
    visit_user_unlock_with_token(user.unlock_token)

    assert warden.authenticated?(:user)
  end

  test "user should not be able to sign in when locked" do
    user = sign_in_as_user(:locked => true)
    assert_template 'sessions/new'
    assert_contain 'Your account is locked.'
    assert_not warden.authenticated?(:user)
  end

  test 'error message is configurable by resource name' do
    store_translations :en, :devise => {
      :sessions => { :admin => { :locked => "You are locked!" } }
    } do
      get new_admin_session_path(:locked => true)
      assert_contain 'You are locked!'
    end
  end

end
