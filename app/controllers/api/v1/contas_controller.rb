class Api::V1::ContasController < ApplicationController
  before_action :set_conta, only: [:show, :update, :destroy]

  def index
    render json: Conta.all.to_json
  end

  def show
    render json: @conta, include: [:transacaos]
  end

  def create
    @conta = Conta.new(conta_params)
    if @conta.save
      render json: { message: 'Conta criada com sucesso' }, status: 201
    else
      # render json: @conta.errors, status: :unprocessable_entity
      render json: { error: 'Não foi possível salvar a Conta' }, status: 400
    end
  end

  def update
    if @conta.update(conta_params)
      render json: { message: 'Conta alterada com sucesso' }, status: 200
    else
      # render json: @conta.errors, status: :unprocessable_entity
      render json: { error: 'Não foi possível alterar a Conta' }, status: 400
    end
  end

  # DELETE /api/v1/contas/1
  def destroy

    if @conta.destroy
      # render json: { successful: true }
      render json: { message: 'Conta excluida com sucesso' }, status: 204
    else
      # render json: @conta.errors, status: :unprocessable_entity
      render json: { error: 'Não foi possível excluir a Conta' }, status: 400
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