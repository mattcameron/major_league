# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  event_date         :datetime
#  description        :text(65535)
#  address_id         :integer
#  favourites         :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
