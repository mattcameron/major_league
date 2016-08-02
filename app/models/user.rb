# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  nickname   :string(255)
#  email      :string(255)
#  bio        :text(65535)
#  skills     :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :bounties

  scope :order_by_points, -> { joins(:bounties).group('users.id').order('sum(bounties.value) desc') }

  def points
    bounties.sum(:value)
  end
end
