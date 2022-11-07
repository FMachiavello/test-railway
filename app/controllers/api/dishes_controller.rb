# frozen_string_literal: true

module Api
  class DishesController < ApplicationController
    before_action :set_dish, only: %i[show update destroy]

    # GET /api/dishes
    # GET /api/dishes.json
    def index
      @dishes = Dish.all
    end

    # GET /api/dishes/1
    # GET /api/dishes/1.json
    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dish_params
      params.fetch(:dish, {}).permit(:name)
    end
  end
end
