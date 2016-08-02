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

require 'test_helper'

class BountyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
