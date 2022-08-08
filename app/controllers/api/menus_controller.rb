# frozen_string_literal: true

module Api
  class MenusController < ApplicationController
    before_action :set_menu, only: %i[show update destroy]

    # GET /api/menus
    # GET /api/menus.json
    def index
      @menus = Menu.all
    end

    # GET /api/menus/1
    # GET /api/menus/1.json
    def show; end

    # POST /api/menus
    # POST /api/menus.json
    def create
      @menu = Menu.new(menu_params)

      if @menu.save
        render :show, status: :created, location: @menu
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/menus/1
    # PATCH/PUT /api/menus/1.json
    def update
      if @menu.update(menu_params)
        render :show, status: :ok, location: @menu
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/menus/1
    # DELETE /api/menus/1.json
    def destroy
      @menu.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.fetch(:menu, {})
    end
  end
end
