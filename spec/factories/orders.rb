# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user
    menu
    dish { menu.dishes.first }
  end
end
