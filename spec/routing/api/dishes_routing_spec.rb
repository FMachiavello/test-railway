# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::DishesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/dishes').to route_to('api/dishes#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/api/dishes/1').to route_to('api/dishes#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/dishes').to route_to('api/dishes#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/dishes/1').to route_to('api/dishes#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/dishes/1').to route_to('api/dishes#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/api/dishes/1').to route_to('api/dishes#destroy', id: '1', format: :json)
    end
  end
end
