FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:username) { |n| "username#{n}" }
    password "password"

    trait :admin do
      admin true
    end
  end
end