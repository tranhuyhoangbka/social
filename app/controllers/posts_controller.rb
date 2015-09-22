class PostsController < ApplicationController
  def index
    user_ids = current_user.timeline_user_ids
    @posts = Post.includes(:user).where(user_id: user_ids).order("created_at DESC")
                                 .paginate(page: params[:page], per_page: 5)
  end

  def show
    @post = Post.find params[:id]
  end
end
