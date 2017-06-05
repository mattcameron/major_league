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

FactoryGirl.define do
  factory :bounty do
    event
    user
    value 10
    name "First Place"
  end
end
