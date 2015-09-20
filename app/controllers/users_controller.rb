class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @posts = @user.posts.order("created_at DESC")
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path, notice: "Welcome to the site!"
    else
      render :new
    end
  end

  def follow
    @user = User.find params[:id]
    if current_user.follow!(@user)
      redirect_to user_path(@user), notice: "follow success"
    else
      redirect_to user_path(@user), alert: "Error follow"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
