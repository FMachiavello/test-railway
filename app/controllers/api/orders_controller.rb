# frozen_string_literal: true

module Api
  class OrdersController < ApplicationController
    before_action :authenticate_api_user!
    before_action :set_order, only: %i[show update destroy]

    def index
      @q = current_api_user.orders.ransack(params[:q])
      @orders = @q.result(distinct: true).includes(:menu)
    end

    def show; end

    def create
      @order = current_api_user.orders.find_or_initialize_by(menu_id: order_params[:menu_id]) 
      if @order.update(order_params)
        render :show, status: :ok, location: [:api, @order]
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
      render json: { message: 'Order was successfully destroyed.' }, status: :ok
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
