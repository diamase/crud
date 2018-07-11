class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    if @post = Post.create(post_params)
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

end
