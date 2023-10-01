class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post: @post, user: current_user)

    if @like.save
      flash[:notice] = 'You have liked the post!.'
    else
      flash[:alert] = "Something is wrong!, you don't liked the post!."
    end

    redirect_to user_post_path(current_user.id, @post.id)
  end
end
