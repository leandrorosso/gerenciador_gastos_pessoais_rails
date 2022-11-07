module Api
  module V1
    class TransacaosController < ApplicationController
      before_action :set_transacao, only: [:show, :update, :destroy]

      def index
        render json: Transacao.all.to_json
      end

      def show
        render json: @transacao
      end

      def create
        transacao = Transacao.new(conta_params)
        if transacao.save
          render json: { successful: true }
        else
          render json: transacao.errors, status: :unprocessable_entity
        end
      end

      def update
        if @transacao.update(conta_params)
          render json: @transacao
        else
          render json: @transacao.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/transacao/1
      def destroy
        @transacao.destroy
      end

      private

      def set_transacao
        @transacao = Transacao.find(params[:id])
      end

      def transacao_params
        params.require(:transacao).params.permit(:tipo, :titulo, :descricao, :valor, :data, :conta_id)
      end
    end
  end
end