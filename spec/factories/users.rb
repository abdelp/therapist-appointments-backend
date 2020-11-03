FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    created_at { '2020-01-01' }
    updated_at { '2020-01-01' }
  end
end
