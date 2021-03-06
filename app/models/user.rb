# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  nickname               :string(255)
#  email                  :string(255)      default(""), not null
#  bio                    :text(65535)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  image_file_name        :string(255)
#  image_content_type     :string(255)
#  image_file_size        :integer
#  image_updated_at       :datetime
#  role                   :integer          default("indian")
#  active                 :boolean          default(TRUE)
#  league_id              :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image,
                    default_url: "/missing/user_:style.jpg",
                    styles: {
                      thumb: "80x80#",
                      medium: '120x120#',
                      large: '250x250#'
                    }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_size :image,
                            :less_than => 5.megabytes,
                            message: "- Bro, that image is fucking huge. Try compressing it on www.kraken.io"

  has_many :skills, dependent: :destroy
  has_many :bounties, dependent: :destroy
  has_many :event_competitors
  has_many :events, -> { distinct }, through: :event_competitors
  has_one  :hosted_event, class_name: 'Event', foreign_key: 'host_id'
  belongs_to :league

  accepts_nested_attributes_for :skills, reject_if: :all_blank

  scope :order_by_points, -> { joins(:bounties).group('users.id').order('sum(bounties.value) desc') }

  enum role: [:indian, :chief]

  after_create :create_event

  def points
    bounties.sum(:value)
  end

  private

  def create_event
    events.create(host_id: id)
  end
end
