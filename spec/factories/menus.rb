# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    draft { false }
    menu_for { Time.current.to_date }
  end
end
