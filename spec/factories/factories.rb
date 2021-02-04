FactoryBot.define do
  factory :user do
    firstname {"a"}
    lastname  {"b"}
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@sample.com" }
    password {"123456"}
    sequence(:id) { rand(0..100) }
  end
end
