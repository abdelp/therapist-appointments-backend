FactoryBot.define do
  factory :therapist do
    sequence(:user_id) do |n|
      n
    end
    img_url { '' }
    created_at { '2020-01-01' }
    updated_at { '2020-01-01' }
  end
end
