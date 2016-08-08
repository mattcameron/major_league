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

class Bounty < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :user, optional: true
end
