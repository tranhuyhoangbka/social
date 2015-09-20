FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email){|n| "user#{n}@gmail.com"}
    password "secret"
    password_confirmation "secret"
  end
end
