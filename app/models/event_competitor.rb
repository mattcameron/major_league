# == Schema Information
#
# Table name: event_competitors
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventCompetitor < ApplicationRecord
  belongs_to :event
  belongs_to :user
end
