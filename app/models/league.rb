# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  admin_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class League < ApplicationRecord
  has_many :users
  has_many :events
  has_one :admin, class_name: 'User', foreign_key: 'id'

  # TODO: Add validation which checks that the admin is a member of the league
end
