require 'rails_helper'

describe Event, type: :model do
  it 'has a valid factory'
  it 'has bounties association'
  it 'has competitors association'
  it 'has event_competitors association'
  it 'has a host'
  it 'is invalid if another event already exists on the same date'
  it 'is invalid if image is not an image file'
  it 'is invalid if image size is over 5MB'
  it 'is invalid if cover_image is not an image file'
  it 'is invalid if cover_image size is over 5MB'
  it 'winner method returns the user with the largest bounty'
  it 'user_points returns the number of points a user won'
end