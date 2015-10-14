require 'test_helper'

class PostsControllerTest < ActionController::TestCase
	
	def setup
		@post = posts(:orange)
	end

	test "should redirect create when not logged in" do
		assert_no_difference 'Post.count' do
			post :create, post: { title: "Lorem Ipsum" }
		end
		assert_redirected_to login_url
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'Post.count' do
			delete :destroy, id: @post
		end
		assert_redirected_to login_url
	end

	test "admin should be able to destroy posts" do
		log_in_as(users(:michael))
		post = posts(:ants)
		assert_difference 'Post.count', 1 do
			delete :destroy, id: post
		end
		assert_not flash.empty?
	end

end
