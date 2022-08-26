# frozen_string_literal: true

main_dish_count = Dish.mains.count

10.times do |i|
  menu_for = Time.current + i.days
  next if menu_for.on_weekend?

  menu = Menu.find_or_create_by menu_for:, draft: false

  menu.dish_menus << DishMenu.create(dish: Dish.mains[i % main_dish_count])

  menu.dish_menus << DishMenu.create(dish: Dish.alternatives.first)
  menu.dish_menus << DishMenu.create(dish: Dish.alternatives.second)
end

5.times do |i|
  menu_for = Time.current + (12 + i).days
  next if menu_for.on_weekend?

  Menu.find_or_create_by menu_for:, draft: true
end
