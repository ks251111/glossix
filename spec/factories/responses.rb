FactoryBot.define do
  factory :response do
    text { Faker::Lorem.sentence }
  end
end
