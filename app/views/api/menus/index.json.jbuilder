# frozen_string_literal: true

json.array! @menus do |menu|
  json.extract! menu, :id, :menu_for
  json.dishes menu.dishes do |dish|
    json.extract! dish, :id, :name
    json.url api_dish_url(dish)
  end
end
