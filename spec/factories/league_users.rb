# == Schema Information
#
# Table name: league_users
#
#  id         :integer          not null, primary key
#  league_id  :integer
#  user_id    :integer
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :league_user do
    league_id 1
    user_id 1
    role 1
  end
end
