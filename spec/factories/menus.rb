# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    draft { false }
    sequence :menu_for do |n|
      Time.current.to_date + n.days
    end

    after(:create) do |menu, _|
      create(:dish, :main, menus: [menu])
      create_list(:dish, 2, :alternative, menus: [menu])

      menu.reload
    end
  end
end
