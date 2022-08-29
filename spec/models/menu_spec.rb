# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:dishes) }
    it { is_expected.to have_many(:orders).dependent(:restrict_with_error) }
  end

  describe 'validations' do
    subject { build(:menu) }

    it { is_expected.to validate_presence_of :menu_for }
    it { is_expected.to validate_uniqueness_of(:menu_for) }
  end
end
