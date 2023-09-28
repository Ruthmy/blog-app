class PostsController < ApplicationController
  def index
    # List all post from a user
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find_by(id: params[:user_id])
    # found the post which 'id' is the same as the parameter 'id' on the URL
    @posts = Post.find(params[:id])
  end
end
