require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobarrr", password_confirmation: "foobarrr")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
 #Max length set here for the edge case of a very long name. And because it's a power of 2 -1
    test "name should not be too long" do
    @user.name = "a" * 128
    assert_not @user.valid?
  end
#Max length set because values >255 tend to overflow databases
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  #email addresses must be unique, non case-sensitive
  #TODO include that info in the signup page
  test "email addresses should be unique" do
    duplicate_user = @user.dup
	duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  #minimum password length is 8
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end
end
