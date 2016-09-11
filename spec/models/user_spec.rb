require "rails_helper"

describe User, type: :model do
  # it "Adds a new user" do
    # expect(User.create!).to change(User.count).by(1)
  # end
  it "has a valid factory"
  it "has skills association"
  it "has bounties association"
  it "has events association"
  it "has events_competitors association"
  it "has one hosted event"
  it "creates hosted event after create"
  it "scope order by points orders by points"
  it "points method returns a user's total points"
  it "is invalid if image size is greater than 5 megabytes"
  it "is invalid if image is not an image file"
  it "is invalid if no password"
  # Any validations I might choose to add

end