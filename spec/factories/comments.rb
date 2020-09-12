FactoryBot.define do
  factory :comment do
    commentable { nil }
    user { nil }
    body { "MyText" }
  end
end
