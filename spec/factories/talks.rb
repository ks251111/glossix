FactoryBot.define do
  factory :talk do
    title { Faker::Lorem.sentence }
    text  { Faker::Lorem.sentence }
    association :user
  end
end
