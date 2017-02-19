# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class League < ApplicationRecord
  has_many :users
  has_many :events

  accepts_nested_attributes_for :users, :events, reject_if: :all_blank, allow_destroy: true
end
