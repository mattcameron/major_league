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