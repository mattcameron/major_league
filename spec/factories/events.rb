FactoryGirl.define do
  factory :event do
    name { Faker::Name.name }
    event_date { Faker::Time.between(DateTime.now - 1.month, DateTime.now + 1.year) }
    description "This is going to be a sweet event"
    favourites "Matt is the hot favourite"
    association :host, factory: :user
  end
end