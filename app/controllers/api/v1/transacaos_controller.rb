class Api::V1::TransacaosController < ApplicationController
  before_action :set_transacao, only: [:show, :update, :destroy]

  def index
    render json: Transacao.all.to_json
  end

  def show
    render json: @transacao
  end

  def create
    @transacao = Transacao.new(transacao_params)

    if @transacao.save
      render json: { message: 'Transação criada com sucesso' }, status: 201
    else
      # render json: @transacao.errors, status: :unprocessable_entity
      render json: { error: 'Não foi possível salvar a Transação' }, status: 400
    end
  end

  def update
    if @transacao.update(transacao_params)
      render json: { message: 'Transação alterada com sucesso' }, status: 200
    else
      # render json: @transacao.errors, status: :unprocessable_entity
      render json: { error: 'Não foi possível alterar a Transação' }, status: 400
    end
  end

  # DELETE /api/v1/transacao/1
  def destroy
    if @transacao.destroy
      render json: { message: 'Transação excluida com sucesso' }, status: 204
    else
      # render json: @conta.errors, status: :unprocessable_entity
      render json: { error: 'Não foi possível excluir a Transação' }, status: 400
    end
  end

  private

  def set_transacao
    @transacao = Transacao.find(params[:id])
  end

  def transacao_params
    params.permit(:tipo, :titulo, :descricao, :valor, :data, :conta_id)
  end
end