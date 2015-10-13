class MainPageController < ApplicationController

  def home
		@feed_items = Post.all.paginate(page: params[:page], per_page: 30,
																		total_entries: 220)
		
  end

	def new
	end

  def top_list
  end
end
