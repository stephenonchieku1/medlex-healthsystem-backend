module Api
  module V1
    class ClientsController < ApplicationController
      before_action :set_client, only: [:show, :update]

      def index
        @clients = Client.all
        render json: @clients
      end

      def show
        render json: @client, include: :enrollments
      end

      def create
        @client = Client.new(client_params)
        
        if @client.save
          render json: @client, status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      def update
        if @client.update(client_params)
          render json: @client
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      def search
        @clients = Client.where("first_name ILIKE :query OR last_name ILIKE :query OR email ILIKE :query OR contact_number ILIKE :query",
                              query: "%#{params[:q]}%")
        render json: @clients
      end

      private

      def set_client
        @client = Client.find(params[:id])
      end

      def client_params
        params.require(:client).permit(
          :first_name,
          :last_name,
          :date_of_birth,
          :gender,
          :address,
          :contact_number,
          :email
        )
      end
    end
  end
end 