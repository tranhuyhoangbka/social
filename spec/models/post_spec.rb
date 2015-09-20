require "rails_helper"

RSpec.describe Post, :type => :model do
  it "has a valid text post" do
    post = build :text_post
    expect(post).to be_valid
  end

  it "post can not have nil user id" do
    post = build :text_post, user_id: nil
    expect(post).not_to be_valid
  end

  it "post can not have nil type" do
    post = build :text_post, type: nil
    expect(post).not_to be_valid
  end
end
