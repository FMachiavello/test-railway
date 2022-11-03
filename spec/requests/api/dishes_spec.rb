# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/dishes', type: :request do
  let(:valid_attributes) do
    attributes_for(:dish)
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Dish.create! valid_attributes
      get api_dishes_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      dish = Dish.create! valid_attributes
      get api_dish_url(dish), as: :json
      expect(response).to be_successful
    end
  end
end
