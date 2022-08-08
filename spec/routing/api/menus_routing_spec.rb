# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MenusController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/menus').to route_to('api/menus#index')
    end

    it 'routes to #show' do
      expect(get: '/api/menus/1').to route_to('api/menus#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/menus').to route_to('api/menus#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/menus/1').to route_to('api/menus#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/menus/1').to route_to('api/menus#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/menus/1').to route_to('api/menus#destroy', id: '1')
    end
  end
end
