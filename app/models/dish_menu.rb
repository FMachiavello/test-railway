# frozen_string_literal: true

class DishMenu < ApplicationRecord
  belongs_to :menu
  belongs_to :dish

  validates :dish, uniqueness: { scope: :menu }
end
