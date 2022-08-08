# frozen_string_literal: true

class Menu < ApplicationRecord
  validates :menu_for, presence: true, uniqueness: true
end
