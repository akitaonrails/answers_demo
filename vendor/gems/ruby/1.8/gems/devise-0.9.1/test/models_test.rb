require 'test/test_helper'

class Configurable < User
  devise :authenticatable, :confirmable, :rememberable, :timeoutable, :lockable,
         :stretches => 15, :pepper => 'abcdef', :confirm_within => 5.days,
         :remember_for => 7.days, :timeout_in => 15.minutes, :unlock_in => 10.days
end

class ActiveRecordTest < ActiveSupport::TestCase
  def include_module?(klass, mod)
    klass.devise_modules.include?(mod) &&
    klass.included_modules.include?(Devise::Models::const_get(mod.to_s.classify))
  end

  def assert_include_modules(klass, *modules)
    modules.each do |mod|
      assert include_module?(klass, mod)
    end

    (Devise::ALL - modules).each do |mod|
      assert_not include_module?(klass, mod)
    end
  end

  test 'add modules cherry pick' do
    assert_include_modules Admin, :authenticatable, :timeoutable
  end

  test 'set a default value for stretches' do
    assert_equal 15, Configurable.stretches
  end

  test 'set a default value for pepper' do
    assert_equal 'abcdef', Configurable.pepper
  end

  test 'set a default value for confirm_within' do
    assert_equal 5.days, Configurable.confirm_within
  end

  test 'set a default value for remember_for' do
    assert_equal 7.days, Configurable.remember_for
  end

  test 'set a default value for timeout_in' do
    assert_equal 15.minutes, Configurable.timeout_in
  end

  test 'set a default value for unlock_in' do
    assert_equal 10.days, Configurable.unlock_in
  end

  test 'set null fields on migrations' do
    Admin.create!
  end
end
