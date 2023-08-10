class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit(:text))
    @comment.author = @user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comentario creado exitosamente.'
    else
      render :new
    end
  end
end
