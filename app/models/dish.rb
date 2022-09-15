# frozen_string_literal: true

class Dish < ApplicationRecord
  has_and_belongs_to_many :menus
  has_many :orders, dependent: :restrict_with_error

  validates :name, presence: true

  scope :mains, -> { where.not(alternative: true) }
  scope :alternatives, -> { where(alternative: true) }
end
