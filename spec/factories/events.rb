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

FactoryGirl.define do
  factory :event do
    name { Faker::Name.name }
    event_date { Faker::Time.between(DateTime.now - 1.month, DateTime.now + 1.year) }
    description "This is going to be a sweet event"
    favourites "Matt is the hot favourite"
    association :host, factory: :user
  end
end
