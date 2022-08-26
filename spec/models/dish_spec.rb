# frozen_string_literal: true

require 'rails_helper'

describe Dish, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:dish_menus) }
    it { is_expected.to have_many(:menus) }
  end

  describe 'validations' do
    subject { build(:dish) }

    it { is_expected.to validate_presence_of :name }
  end
end
