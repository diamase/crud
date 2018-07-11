class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :create, :update, :destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Your comment has been created"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Your comment couldn't be created. Please check the form."
      render root_path
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted."
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
