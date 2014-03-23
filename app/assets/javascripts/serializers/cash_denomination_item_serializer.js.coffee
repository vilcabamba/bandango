Bandango.CashDenominationItemSerializer = Bandango.ApplicationSerializer.extend
  serialize: (record, options) ->
    cantidad: record.get("cantidad"),
    cash_denomination_id: record.get("cashDenomination.id")
