# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/dishes', type: :request do
  let(:valid_attributes) do
    attributes_for(:dish)
  end

  let(:invalid_attributes) do
    { name: '' }
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

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Dish' do
        expect do
          post api_dishes_url,
               params: { dish: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Dish, :count).by(1)
      end

      it 'renders a JSON response with the new dish' do
        post api_dishes_url,
             params: { dish: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Dish' do
        expect do
          post api_dishes_url,
               params: { dish: invalid_attributes }, as: :json
        end.not_to change(Dish, :count)
      end

      it 'renders a JSON response with errors for the new dish' do
        post api_dishes_url,
             params: { dish: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'Dish 2' }
      end

      it 'updates the requested dish' do
        dish = Dish.create! valid_attributes
        patch api_dish_url(dish),
              params: { dish: new_attributes }, headers: valid_headers, as: :json
        dish.reload
        expect(dish).to have_attributes(name: 'Dish 2')
      end

      it 'renders a JSON response with the dish' do
        dish = Dish.create! valid_attributes
        patch api_dish_url(dish),
              params: { dish: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the dish' do
        dish = Dish.create! valid_attributes
        patch api_dish_url(dish),
              params: { dish: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested dish' do
      dish = Dish.create! valid_attributes
      expect do
        delete api_dish_url(dish), headers: valid_headers, as: :json
      end.to change(Dish, :count).by(-1)
    end
  end
end
