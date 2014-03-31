class CashDenominationItemSerializer < ActiveModel::Serializer
  attributes :id, :cantidad

  has_one :cash_denomination, embed: :ids, include: true
end
