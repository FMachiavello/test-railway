# frozen_string_literal: true

main_dish_count = Dish.mains.count

10.times do |i|
  menu_for = Time.current + i.days
  next if menu_for.on_weekend?

  menu = Menu.find_or_create_by menu_for:, draft: false

  menu.dishes << Dish.mains[i % main_dish_count]

  menu.dishes << Dish.alternatives.first
  menu.dishes << Dish.alternatives.second
end

5.times do |i|
  menu_for = Time.current + (12 + i).days
  next if menu_for.on_weekend?

  Menu.find_or_create_by menu_for:, draft: true
end
