class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(post: @post, author: @user, text: comment_params[:text])
    if @comment.save
      flash[:notice] = 'Comment successfully added!'
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = 'Comment could not be added.'
      redirect_to new_user_post_comment_path(@user, @post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
