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
#  host_id            :integer
#

class Event < ApplicationRecord
  has_many :bounties
  has_attached_file :image, default_url: "/missing/coming-soon.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :event_competitors
  has_many :competitors, -> { distinct }, through: :event_competitors, source: :user
  belongs_to :host, class_name: 'User', optional: true

  accepts_nested_attributes_for :bounties, reject_if: :all_blank, allow_destroy: true

  def winner
    # TODO - refactor
    bounty = bounties.joins(:user).order(value: :desc).first
    bounty.try(:user)
  end
end
