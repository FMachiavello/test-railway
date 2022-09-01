# frozen_string_literal: true

require 'rails_helper'

describe Dish, type: :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:menus) }
  end

  describe 'validations' do
    subject { build(:dish) }

    it { is_expected.to validate_presence_of :name }
  end

  describe 'scopes' do
    describe '.main' do
      let!(:main_dish) { create(:dish, :main) }
      let!(:alternative_dish) { create(:dish, :alternative) }

      it 'includes dishes without alternative flag' do
        expect(described_class.mains).to include(main_dish)
      end

      it 'excludes dishes with alternative flag' do
        expect(described_class.mains).not_to include(alternative_dish)
      end
    end

    describe '.alternative' do
      let!(:main_dish) { create(:dish, :main) }
      let!(:alternative_dish) { create(:dish, :alternative) }

      it 'includes dishes with alternative flag' do
        expect(described_class.alternatives).to include(alternative_dish)
      end

      it 'excludes dishes without alternative flag' do
        expect(described_class.alternatives).not_to include(main_dish)
      end
    end
  end
end
