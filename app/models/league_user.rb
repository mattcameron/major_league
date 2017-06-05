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

class LeagueUser < ApplicationRecord
  belongs_to :user
  belongs_to :league

  enum role: [:regular, :admin]

  accepts_nested_attributes_for :user, reject_if: :all_blank, allow_destroy: true
end
