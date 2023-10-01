class PostsController < ApplicationController
  def index
    # List all post from a user
    @user = User.find_by(id: params[:user_id])
    # All posts from a user and paginate them
    @posts = @user.posts.page(params[:page]).per(4)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    # found the post which 'id' is the same as the parameter 'id' on the URL
    @posts = Post.find(params[:id])
  end
end
