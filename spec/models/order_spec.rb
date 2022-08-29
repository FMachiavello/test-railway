# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { create(:order) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:menu) }
    it { is_expected.to belong_to(:dish) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:menu_id).scoped_to(:user_id) }

    describe 'dish_should_belong_to_menu' do
      let(:user) { create(:user) }
      let(:dish) { create(:dish) }
      let(:menu) { create(:menu) }

      context 'when the dish does not belong to the menu' do
        it 'returns an error' do
          order = described_class.create(user:, menu:, dish:)

          order.validate

          expect(order.errors).to be_of_kind(:dish, :dish_should_belong_to_menu)
        end
      end
      # context 'when the dish belongs to the menu' do
      # end
    end
  end
end
