class Api::V1::ContaResource < JSONAPI::Resource
  attributes :titulo, :saldo
  has_many :transacaos
end