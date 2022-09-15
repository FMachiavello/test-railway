# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "example#{n}@exmaple.com"
    end
    password { 'password' }
  end
end
