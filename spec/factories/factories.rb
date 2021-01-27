FactoryBot.define do
  factory :user do
    firstname {"a"}
    lastname  {"b"}
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@sample.com" }
    password {"123456"}
  end
end
FactoryBot.define do
  factory :challenge do
    title { "test" }
    description { "test description" }
    user { FactoryBot.create(:user)}
  end
end