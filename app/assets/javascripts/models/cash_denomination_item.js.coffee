Bandango.CashDenominationItem = DS.Model.extend
  cantidad:         DS.attr()

  cashDenomination: DS.belongsTo("cashDenomination")
  cierreCaja:       DS.belongsTo("cierreCaja")

# methods
  totalPrice: (->
    @get("cantidad") * @get("cashDenomination.price")
  ).property("cantidad", "cashDenomination")
