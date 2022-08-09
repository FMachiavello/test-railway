# frozen_string_literal: true

require 'rails_helper'

describe Dish, type: :model do
  describe 'validations' do
    subject { build(:dish) }

    it { is_expected.to validate_presence_of :name }
  end
end
