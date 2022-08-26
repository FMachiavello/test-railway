# frozen_string_literal: true

json.extract! menu, :id, :created_at, :updated_at
json.url api_menu_url(menu, format: :json)
