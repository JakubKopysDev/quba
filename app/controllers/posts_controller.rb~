class PostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def show
		@post= Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post added"
			redirect_to root_path
		else
			render 'posts/new'
		end
	end

	def destroy
		post_destroy = Post.find(params[:id])
		post_destroy.destroy
		flash[:success] = "Post deleted"
		redirect_to request.referrer || root_url
	end

	def like
		@post = Post.find(params[:id])
		if @like = Like.find_by(likeable: @post, user: current_user)
			#Like.find_by(likeable: @post, user: current_user, like: true).destroy
			@like.destroy
			respond_to do |format|
				format.html {
					flash[:success] = "Like Updated!"
					redirect_to :back
				}
				format.js
				end
		else
			Like.create(likeable: @post, user: current_user, like: true)
			respond_to do |format|
				format.html {
					flash[:success] = "Like Updated!"
					redirect_to :back
				}
				format.js
			end
		end
	end

	#def like
	#	post = Post.find(params[:id])
	#	if Like.find_by(likeable: post)
	#		Like.find_by(likeable: post).destroy
	#		flash[:success] = "Post unliked!"
	#		redirect_to :back
	#	else
	#		Like.create(likeable: post, user: current_user, like: params[:like])
	#		flash[:success] = "Post liked!"
	#		redirect_to :back
	#	end
	#end

	private

		def post_params
			params.require(:post).permit(:title, :avatar)
		end

end
