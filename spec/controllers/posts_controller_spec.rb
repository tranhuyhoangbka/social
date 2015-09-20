require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "get #show" do
    it "have assign post" do
      post = create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
  end
end
