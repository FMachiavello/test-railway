# frozen_string_literal: true

class Dish < ApplicationRecord
  has_many :dish_menus, dependent: :destroy
  has_many :menus, through: :dish_menus

  validates :name, presence: true

  scope :mains, -> { where.not(alternative: true) }
  scope :alternatives, -> { where(alternative: true) }
end
