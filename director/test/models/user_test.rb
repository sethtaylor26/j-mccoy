require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "do not save without email" do
      user = User.new
      assert_not user.save, "saved without an email address"
   end
end
