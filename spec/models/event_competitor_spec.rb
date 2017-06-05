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

require 'spec_helper'

describe EventCompetitor, type: :model do
  it 'has a valid factory'
  it 'has user association'
  it 'has event association'
end
