# frozen_string_literal: true

module Api
  class MenusController < ApplicationController
    before_action :set_menu, only: %i[show]

    # GET /api/menus
    # GET /api/menus.json
    def index
      @q = Menu.published.includes(:dishes).ransack(params[:q])
      @menus = @q.result(distinct: true)
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
