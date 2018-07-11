class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def show
  end

  def create
    if @post = current_user.posts.build(post_params)
      flash[:success] = "Your post has been created"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post couldn't be created. Please check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to @post
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Successfully deleted post"
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    unless current_user == @post.user
      flash.now[:alert] = "Unauthorized."
      redirect_to root_path
    end
  end

end
