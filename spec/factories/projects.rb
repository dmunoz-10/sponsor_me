# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { 'MyString' }
    donation_goal { '9.99' }
    user { nil }
  end
end
