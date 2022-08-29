# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  belongs_to :dish

  validates :menu_id, uniqueness: { scope: :user_id }

  validate :dish_should_belong_to_menu

  private

  def dish_should_belong_to_menu
    errors.add(:dish, :dish_should_belong_to_menu) unless dish.in?(menu&.dishes || Dish.none)
  end
end
