FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    username "luc_dai_ca"
    password "password"

    trait :admin do
      admin true
    end
  end
end