class Transacao < ApplicationRecord
  belongs_to :conta

  validates :titulo, :tipo, :descricao, :valor, :data, :conta_id, presence: true

  before_validation :update_saldo_valor

  private

  def update_saldo_valor
    novo_saldo = transacao.tipo = 1 ? (conta.saldo + valor) : (conta.saldo - valor)
    conta.update(saldo: novo_saldo)
  end
end
