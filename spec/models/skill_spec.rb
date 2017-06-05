# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  value      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "spec_helper"

describe Skill, type: :model do
  it "has a valid factory" do
    expect(build(:skill)).to be_valid
  end

  it "has user association"

  it "is invalid if value is less than 0" do
    expect(build(:skill, value: -10)).to be_invalid
  end

  it "is invalid if value is greater than 100" do
    expect(build(:skill, value: 110)).to be_invalid
  end
end
