class TextPostsController < ApplicationController
  before_action :load_text_post, except: [:new, :create]

  def new
    @text_post = TextPost.new
  end

  def create
    @text_post = current_user.text_posts.build text_post_params
    if @text_post.save
      redirect_to post_path(@text_post), notice: "Text Post is created!"
    else
      render :new, alert: "Error, creating Text post"
    end
  end

  def edit
  end

  def update
    if @text_post.update_attributes text_post_params
      redirect_to post_path(@text_post), notice: "Text Post has been updated!"
    else
      render :edit, alert: "Fail!. Text Post yet not updated"
    end
  end

  private
  def load_text_post
    @text_post = current_user.text_posts.find params[:id]
  end

  def text_post_params
    params.require(:text_post).permit :title, :body
  end
end
