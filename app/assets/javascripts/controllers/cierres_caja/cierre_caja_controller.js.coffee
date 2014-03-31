Bandango.CierreCajaController = Ember.Controller.extend
# bill or coin items
  coinDenominationItems: (->
    @get("model.cashDenominationItems").filterBy "cashDenomination.kind", "coin"
  ).property("model.cashDenominationItems.@each")

  billDenominationItems: (->
    @get("model.cashDenominationItems").filterBy "cashDenomination.kind", "bill"
  ).property("model.cashDenominationItems.@each")

# aggregate operations
  totalValueFor: (kind) ->
    Ember.debug "computing totalValueFor:#{kind}"
    @get("#{kind}DenominationItems").reduce (prev, cashDenominationItem) ->
      prev + cashDenominationItem.get("totalPrice")
    , 0

  countFor: (kind) ->
    Ember.debug "computing countFor:#{kind}"
    @get("#{kind}DenominationItems").reduce (prev, cashDenominationItem) ->
      prev + cashDenominationItem.get("cantidad")
    , 0

# aggregate properties
  billTotalValue: (-> @totalValueFor("bill") )
  .property("billDenominationItems.@each.cantidad")

  coinTotalValue: (-> @totalValueFor("coin") )
  .property("coinDenominationItems.@each.cantidad")

  billCount: (-> @countFor("bill") )
  .property("billDenominationItems.@each.cantidad")

  coinCount: (-> @countFor("coin") )
  .property("coinDenominationItems.@each.cantidad")
