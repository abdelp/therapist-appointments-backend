FactoryBot.define do
  factory :appointment do
    trait :user_id do
      user_id { nil }    
    end
  
    trait :therapist_id do
      user_id { nil }    
    end

    start_at { Faker::Time.between(from: 2.years.ago, to: 2.years.since) }
    end_at { start_at + rand(15..180).minutes }
    user_id nil
    therapist_id nil

    trait :in_one_hour do
      end_at { start_at + 1.hour }
    end
  end
end