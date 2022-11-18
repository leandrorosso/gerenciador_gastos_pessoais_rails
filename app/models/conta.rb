class Conta < ApplicationRecord
  has_many :transacaos

  validates :titulo, presence: true
end
