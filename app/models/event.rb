# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  event_date  :datetime
#  description :text(65535)
#  address_id  :integer
#  favourites  :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  has_many :bounties

  accepts_nested_attributes_for :bounties, reject_if: :all_blank, allow_destroy: true
end
