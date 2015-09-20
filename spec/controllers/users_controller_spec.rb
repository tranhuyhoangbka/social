require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET #new" do
    it "should new instance user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "render new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "Post #create" do
    it "save the new user to database" do
      expect{
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end
  end
end
