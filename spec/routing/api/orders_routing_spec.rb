# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::OrdersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/orders').to route_to('api/orders#index')
    end

    it 'routes to #show' do
      expect(get: '/api/orders/1').to route_to('api/orders#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/orders').to route_to('api/orders#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/orders/1').to route_to('api/orders#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/orders/1').to route_to('api/orders#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/orders/1').to route_to('api/orders#destroy', id: '1')
    end
  end
end
