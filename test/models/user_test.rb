require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a new user should have no stars" do
    u = User.new
    assert u.no_stars === 0
  end

  test "the user should have one star" do
    u = User.new
    u.add_star!()
    assert u.no_stars === 1
  end
end
