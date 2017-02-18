FactoryGirl.define do
  factory :bounty do
    event
    user
    value 10
    name "First Place"
  end
end