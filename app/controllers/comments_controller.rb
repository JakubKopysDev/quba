class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.valid?
      @comment.user = current_user
      @comment.save
      redirect_to @post
    else
      flash[:danger] = "Comment must be 4 to 200 letter long."
      redirect_to :back
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user)
    end
end
