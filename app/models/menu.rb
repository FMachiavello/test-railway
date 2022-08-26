# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :dish_menus, dependent: :destroy
  has_many :dishes, through: :dish_menus

  validates :menu_for, presence: true, uniqueness: true
end
