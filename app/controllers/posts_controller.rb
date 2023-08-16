class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.post_comments
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find_by(id: params[:id])
    return @post unless @post.nil?

    head :not_found
    nil
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(params.require(:post).permit(:title, :text))

    if @post.save
      redirect_to users_path
    else
      render :new
    end
  end
end
