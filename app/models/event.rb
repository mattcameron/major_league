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

class Event < ApplicationRecord
  has_many :bounties
  has_many :event_competitors
  has_many :competitors, -> { distinct }, through: :event_competitors, source: :user
  belongs_to :host, class_name: 'User'
  belongs_to :league

  has_attached_file :image, default_url: "/missing/coming-soon.png"
  has_attached_file :cover_image, default_url: "/missing/event-cover.jpg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_size :image, :cover_image,
                            :less_than => 5.megabytes,
                            message: "- Bro, that image is fucking huge. Try compressing it on www.kraken.io"

  accepts_nested_attributes_for :bounties, reject_if: :all_blank, allow_destroy: true


  def winner
    # TODO - refactor
    bounty = bounties.joins(:user).order(value: :desc).first
    bounty.try(:user)
  end

  def user_points(user)
    points = bounties.find_by(user_id: user.id).try(:value)
    points ||= 0
  end
end
