require 'spec_helper'

describe Event, type: :model do
  before :each do
    @event = create(:event)
  end

  it 'has a valid factory' do
    expect(@event).to be_valid
  end
  it 'has bounties association'
  it 'has competitors association'
  it 'has event_competitors association'

  it 'has a host' do
    expect(@event.host).to be
  end

  it 'is invalid if another event already exists on the same date' do
    @existing_event = create(:event, event_date: Time.zone.now + 1.week)
    @new_event = build(:event, event_date: Time.zone.now + 1.week)
    expect(@new_event).to be_invalid
  end

  it 'winner method returns the user with the largest bounty' do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @event.bounties.create(user: @user1, value: 5)
    @event.bounties.create(user: @user2, value: 12)
    @event.bounties.create(user: @user3, value: 8)
    expect(@event.winner).to eq(@user2)
  end

  it 'user_points returns the number of points a user won' do
    @user = create(:user)
    @event.bounties.create(user: @user, value: 10, name: '10 points')
    expect(@event.user_points(@user)).to be 10
  end

  it 'user_points returns 0 if user has not won any points' do
    @user = create(:user)
    expect(@event.user_points(@user)).to be 0
  end
end