FactoryBot.define do
  factory :appointment do
    trait :user_id do
      user_id { nil }
    end

    trait :therapist_id do
      therapist_id { nil }
    end

    start_at { Faker::Time.between(from: 2.years.ago, to: 2.years.since) }
    user_id nil
    therapist_id { nil }
  end
end
