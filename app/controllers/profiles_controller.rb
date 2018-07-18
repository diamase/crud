class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :owned_profile, only: [:edit, :update, :destroy]

  def show
    @posts = @user.posts.order('created_at DESC')
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated."
      redirect_to profile_path(@user.username)
    else
      @user.errors.full_messages
      flash[:error] = @user.error.full_messages
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:bio, :image)
  end

  def set_user
    @user = User.find_by(:username => params[:username])
  end

  def owned_profile
    unless current_user == @user
      flash[:alert] = "Unauthorized."
      redirect_to root_path
    end
  end
end
