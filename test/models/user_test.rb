require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "users with the same username" do
    # create user with username 222
    user= User.new(id: 999, username: "222",password: "222")
    assert_equal true, user.save
    
    user1 = User.new(id: 999, username: "222",password: "222")
    # tried to save one more user with username 222
    assert_equal false, user1.save
    
    # delete user with username 222
    User.find_by(username: "222").destroy
    assert_nil User.find_by(username: "222")
  end
end
