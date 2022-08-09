# frozen_string_literal: true

module Api
  class MenusController < ApplicationController
    before_action :set_menu, only: %i[show]

    # GET /api/menus
    # GET /api/menus.json
    def index
      @menus = Menu.published.all
    end

    # GET /api/menus/1
    # GET /api/menus/1.json
    def show; end

    private

    def set_menu
      @menu = Menu.published.find(params[:id])
    end
  end
end
