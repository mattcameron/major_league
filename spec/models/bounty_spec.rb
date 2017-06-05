# == Schema Information
#
# Table name: bounties
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  value      :integer
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

describe Bounty, type: :model do
  it "has a valid factory"
  it "has events association"
  it "has user association"
end
