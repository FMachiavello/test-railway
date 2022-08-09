# frozen_string_literal: true

json.array! @menus, partial: 'api/menus/menu', as: :menu
