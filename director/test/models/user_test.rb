require 'test_helper'

include TokenAuthenticatable

class UserTest < ActiveSupport::TestCase
   test "do not save without email" do
      user = User.new
      assert_not user.save, "saved without an email address"
   end
   
   # TODO: need to add an effective auth token test */
   # test "auth token returned with new user" do
   #   user = User.new
   #   user.email = "authtest@example.com"
   #   user.save
   #   assert_not_nil user.authentication_token		
   # end
end
