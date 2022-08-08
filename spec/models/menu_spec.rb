# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'validations' do
    subject { build(:menu) }

    it { is_expected.to validate_presence_of :menu_for }
    it { is_expected.to validate_uniqueness_of(:menu_for) }
  end
end
