# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    admin { [true, false].sample }

    trait :admin do
      admin { true }
    end

    trait :member do
      admin { false }
    end
  end
end
