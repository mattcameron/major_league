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
#  active                 :boolean          default(TRUE)
#  role                   :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Superhero.name }
    email { Faker::Internet.email }
    bio { Faker::ChuckNorris.fact }
    password "password"
    password_confirmation "password"

    after(:create) do |user, evaluator|
      create_list(:skill, 4, user: user)
    end
  end
end
