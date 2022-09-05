# frozen_string_literal: true

module Api
  class OrdersController < ApplicationController
    before_action :authenticate_api_user!
    before_action :set_order, only: %i[show update destroy]

    def index
      @orders = current_api_user.orders
    end

    def show; end

    def create
      @order = current_api_user.orders.build(order_params)

      if @order.save
        render :show, status: :created, location: [:api, @order]
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    def update
      if @order.update(order_params)
        render :show, status: :ok, location: [:api, @order]
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @order.destroy
    end

    private

    def set_order
      @order = current_api_user.orders.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:menu_id, :dish_id)
    end
  end
end
