# frozen_string_literal: true

FactoryBot.define do
  factory :dish do
    name { 'Piza' }
  end

  trait :main do
    alternative { false }
  end

  trait :alternative do
    alternative { true }
  end
end
