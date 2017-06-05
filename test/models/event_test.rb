# == Schema Information
#
# Table name: events
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  event_date               :date
#  description              :text(65535)
#  favourites               :text(65535)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  image_file_name          :string(255)
#  image_content_type       :string(255)
#  image_file_size          :integer
#  image_updated_at         :datetime
#  host_id                  :integer
#  cover_image_file_name    :string(255)
#  cover_image_content_type :string(255)
#  cover_image_file_size    :integer
#  cover_image_updated_at   :datetime
#  address                  :string(255)
#  league_id                :integer
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
