require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "layout links" do
		get root_path
		assert_template 'main_page/home'
		assert_select 'a[href=?]', root_path, count: 1
		assert_select 'a[href=?]', login_path, count: 1
		assert_select 'a[href=?]', users_path, count: 0
		user = users(:michael)
		log_in_as(user)
		get root_path
		assert_select 'a[href=?]', root_path, count: 1
		assert_select 'a[href=?]', login_path, count: 0
		assert_select 'a[href=?]', users_path, count: 1
		assert_select 'a[href=?]', logout_path, count: 1
	end

end
