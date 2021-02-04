FactoryBot.define do
  factory :challenge do
    title { "test" }
    description { "test description" }
    user { FactoryBot.create(:user)}
  end
end
