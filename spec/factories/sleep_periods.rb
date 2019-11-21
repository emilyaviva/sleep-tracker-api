FactoryBot.define do
  factory :sleep_period do
    started_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now - 1) }
    ended_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    quality { Faker::Number.within(range: 0..3) }
    notes { Faker::Lorem.sentence }
  end
end
