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

    # POST /api/dishes
    # POST /api/dishes.json
    def create
      @dish = Dish.new(dish_params)

      if @dish.save
        render :show, status: :created, location: @dish
      else
        render json: @dish.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/dishes/1
    # PATCH/PUT /api/dishes/1.json
    def update
      if @dish.update(dish_params)
        render :show, status: :ok, location: @dish
      else
        render json: @dish.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/dishes/1
    # DELETE /api/dishes/1.json
    def destroy
      @dish.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dish_params
      params.fetch(:dish, {})
    end
  end
end
