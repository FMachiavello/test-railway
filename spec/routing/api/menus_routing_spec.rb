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
  end
end
