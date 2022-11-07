module Api
  module V1
    class ContasController < ApplicationController
      before_action :set_conta, only: [:show, :update, :destroy]

      def index
        render json: Conta.all.to_json
      end

      def show
        render json: @conta
      end

      def create
        @conta = Conta.new(conta_params)
        if @conta.save
          render json: { successful: true }
        else
          render json: @conta.errors, status: :unprocessable_entity
        end
      end

      def update
        if @conta.update(conta_params)
          render json: @conta
        else
          render json: @conta.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/contas/1
      def destroy

        if @conta.destroy
          render json: { successful: true }
        else
          render json: @conta.errors, status: :unprocessable_entity
        end
      end

      private
      def set_conta
        @conta = Conta.find(params[:id])
      end

      def conta_params
        params.permit(:titulo, :saldo)
      end
    end
  end
end