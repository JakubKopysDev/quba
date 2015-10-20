class MainPageController < ApplicationController

  def home
    @feed_items = Post.all.paginate(page: params[:page], per_page: 20,
																		total_entries: 220)
  end

  def top_list
    @feed_items = Post.all.unscoped.toplist.limit(10)
  end

end
