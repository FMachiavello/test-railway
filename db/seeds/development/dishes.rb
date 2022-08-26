# frozen_string_literal: true

Dish.find_or_create_by name: 'Pizza'
Dish.find_or_create_by name: 'Sushi'
Dish.find_or_create_by name: 'Burger'
Dish.find_or_create_by name: 'Pie', alternative: true
Dish.find_or_create_by name: 'Omelette', alternative: true
