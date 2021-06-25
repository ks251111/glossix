FactoryBot.define do
  factory :relationship do
    association :user
    association :follower
  end
end
