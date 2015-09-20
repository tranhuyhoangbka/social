require "rails_helper"

RSpec.describe User, type: :model do
  before :each do
    @user1 = create :user
    @user2 = create :user
    @user = build :user
  end
  it "it should have valid user" do
    expect(@user).to be_valid
  end

  it "it should not have nil email" do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it "it should not have duplicate email" do
    @user1 = create :user, email: "bob@gmail.com"
    @user.email = "bob@gmail.com"
    expect(@user).not_to be_valid
  end

  it "check following a other" do
    subscription = create :subscription, leader_id: @user2.id, follower_id: @user1.id
    expect(@user1.following?(@user2)).to be true
  end

  it "allow user follow other" do
    @user1.follow!(@user2)
    expect(@user1.leaders).to match_array [@user2]
  end

  it "return time line user ids" do
    @user1.follow!(@user2)
    expect(@user1.timeline_user_ids).to match_array [@user1.id, @user2.id]
  end
end
