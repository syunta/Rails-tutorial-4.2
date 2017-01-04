require 'test_helper'

class UsersHomeTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "home stats" do
    log_in_as(@user)
    get root_path
    assert_select 'a[href=?]', followers_user_path(@user), count: 1
    assert_select 'a>strong', @user.followers.count
    assert_select 'a[href=?]', following_user_path(@user), count: 1
    assert_select 'a>strong', @user.following.count
  end

end
