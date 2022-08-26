# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/menus', type: :request do
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    let(:menu) { create(:menu) }

    it 'renders a successful response' do
      get api_menus_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:menu) { create(:menu) }

    it 'renders a successful response' do
      get api_menu_url(menu), as: :json
      expect(response).to be_successful
    end
  end
end
