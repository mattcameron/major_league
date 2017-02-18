FactoryGirl.define do
  factory :skill do
    user
    value { Random.rand(100) }
    name { Faker::Superhero.power }
  end
end