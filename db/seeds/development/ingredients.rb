# frozen_string_literal: true

Ingredient.find_or_create_by name: 'Flour'
Ingredient.find_or_create_by name: 'Salt'
Ingredient.find_or_create_by name: 'Tomato sauce'
Ingredient.find_or_create_by name: 'Mozzarella'
Ingredient.find_or_create_by name: 'Parmesan'
Ingredient.find_or_create_by name: 'Rice'
Ingredient.find_or_create_by name: 'Salmon'
Ingredient.find_or_create_by name: 'Cibulette'
Ingredient.find_or_create_by name: 'Avocado'
Ingredient.find_or_create_by name: 'Potatoes'
Ingredient.find_or_create_by name: 'Eggs'

pizza = Dish.find_by name: 'Pizza'
pizza.ingredients << Ingredient.find_by(name: 'Flour')
pizza.ingredients << Ingredient.find_by(name: 'Salt')
pizza.ingredients << Ingredient.find_by(name: 'Tomato sauce')
pizza.ingredients << Ingredient.find_by(name: 'Mozzarella')
pizza.ingredients << Ingredient.find_by(name: 'Parmesan')

sushi = Dish.find_by name: 'Sushi'
sushi.ingredients << Ingredient.find_by(name: 'Rice')
sushi.ingredients << Ingredient.find_by(name: 'Salmon')
sushi.ingredients << Ingredient.find_by(name: 'Cibulette')
sushi.ingredients << Ingredient.find_by(name: 'Avocado')

omelette = Dish.find_by name: 'Omelette'
omelette.ingredients << Ingredient.find_by(name: 'Eggs')
omelette.ingredients << Ingredient.find_by(name: 'Potatoes')
omelette.ingredients << Ingredient.find_by(name: 'Cibulette')
omelette.ingredients << Ingredient.find_by(name: 'Salt')

