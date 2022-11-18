class Api::V1::TransacaoResource < JSONAPI::Resource
  attributes :titulo, :tipo, :descricao, :valor, :data, :conta_id
  has_one :conta
end