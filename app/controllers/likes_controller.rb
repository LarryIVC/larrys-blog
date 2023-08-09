class LikesController < ApplicationController
  before_action :set_user, :set_post

  def create
    @like = Like.create(author_id: @user.id, post_id: @post.id)
    redirect_to user_post_path(@user, @post), notice: 'You liked this post'
  end

  private

  def set_user
    @user = current_user
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
