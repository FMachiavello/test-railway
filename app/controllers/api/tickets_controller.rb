module Api
  class TicketsController < ApplicationController
    before_action :authenticate_api_user!
    # protect_from_forgery with: :null_session

    def index
      @q = Ticket.find_by(user_id: current_api_user.id)
      render json: @q
    end

    def show
      @ticket = Ticket.find_by(user_id: params[:id])
      render json: @ticket
    end

    def create
      @ticket = Ticket.new(amount: ticket_params[:amount], last_update: '2022-09-11', user_id: current_api_user.id)
      if @ticket.save
        render json: @ticket
      else
        render error: {error:'Unable to create a ticket.'}, status:400
      end
    end

    def update

    end

    private

    def ticket_params
      params.permit(:amount)
    end
  end
end
