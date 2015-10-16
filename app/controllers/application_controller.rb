class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	include SessionsHelper

	private

	# Confirms a logged-in user.
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end

	def liked(type)
	  @like = Like.find_by(likeable: type, user: current_user)
	  if @like
	    return @like.like
	  else
	    return false
	  end
	end

end
