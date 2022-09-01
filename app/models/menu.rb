# frozen_string_literal: true

class Menu < ApplicationRecord
  has_and_belongs_to_many :dishes

  validates :menu_for, presence: true, uniqueness: true

  scope :published, -> { where.not(draft: true) }
end
