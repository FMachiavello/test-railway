# frozen_string_literal: true

class Dish < ApplicationRecord
  validates :name, presence: true
end
