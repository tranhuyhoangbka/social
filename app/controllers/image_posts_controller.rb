class ImagePostsController < ApplicationController
  before_action :load_image_post

  def edit
  end

  def update
    if @image_post.update_attributes image_post_params
      redirect_to post_path(@image_post), notice: "Image Post has updated!"
    else
      render :edit, alert: "Fail. Image Post not updated"
    end
  end

  private
  def image_post_params
    params.require(:image_post).permit :title, :url
  end

  def load_image_post
    @image_post = current_user.image_posts.find params[:id]
  end
end
