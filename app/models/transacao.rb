class Transacao < ApplicationRecord
  belongs_to :conta

  validates :titulo, :tipo, :descricao, :valor, :data, :conta_id, presence: true

  before_validation :update_saldo_valor

  after_destroy :delete_saldo_valor

  private

  def update_saldo_valor
    tipo == 1 ? atualiza_saldo(valor) : atualiza_saldo(valor * -1)
  end

  def delete_saldo_valor
    tipo == 1 ? atualiza_saldo(valor * -1) : atualiza_saldo(valor)
  end

  def atualiza_saldo valor_lancado
    conta.update(saldo: (conta.saldo + valor_lancado))
  end
end