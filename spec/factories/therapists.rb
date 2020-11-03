FactoryBot.define do
  factory :therapist do
    sequence(:user_id) { |n|
      n
    }
    img_url { '' }
    created_at { '2020-01-01' }
    updated_at { '2020-01-01' }
  end
end
