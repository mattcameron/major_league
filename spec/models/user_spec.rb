require "spec_helper"

describe User, type: :model do
  before :each do
    @user = create(:user)
  end
  it "has a valid factory" do
    expect(@user).to be_valid
  end

  it "has skills association" do
    # Fix with shoulda matchers
    expect(@user.skills).to be
  end
  it "has bounties association"
  it "has events association"
  it "has events_competitors association"
  it "has one hosted event association"

  it "creates hosted event after create" do
    expect(create(:user).hosted_event).to be
  end

  it "scope order_by_points orders by points" do
    @user2 = create(:user)
    @user3 = create(:user)
    @event = @user.hosted_event
    @event.bounties.create(user: @user, value: 3)
    @event.bounties.create(user: @user2, value: 1)
    @event.bounties.create(user: @user3, value: 2)

    expect(User.order_by_points).to eq [@user, @user3, @user2]
  end

  it "points method returns a user's total points" do
    @user.hosted_event.bounties.create(user: @user, value: 5)
    expect(@user.points).to eq(5)
  end

  it "points method 0 if user hasn't won any points" do
    expect(create(:user).points).to eq(0)
  end

  it "is invalid if no password" do
    @new_user = build(:user, password: nil, password_confirmation: nil)
    expect(@new_user).to be_invalid
  end

  it "is invalid if no email" do
    @new_user = build(:user, email: nil)
    expect(@new_user).to be_invalid
  end

  it "is an 'indian' by default" do
    expect(@user.role).to eq('indian')
  end
end