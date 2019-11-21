FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    birthdate { Faker::Date.birthday(min_age: 0, max_age: 100) }
  end
end
