# frozen_string_literal: true

FactoryBot.define do
  factory :therapist do
    trait :user_id do
      user_id { nil }
    end

    sequence(:user_id)

    created_at { '2020-01-01' }
    updated_at { '2020-01-01' }
  end
end
