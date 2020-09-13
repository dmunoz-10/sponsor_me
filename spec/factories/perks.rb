FactoryBot.define do
  factory :perk do
    title { "MyString" }
    amount { "9.99" }
    description { "MyText" }
    quantity { 1 }
    project { nil }
  end
end
