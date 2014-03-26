Bandango.CierresCajaNewController = Ember.Controller.extend
# bills or coins
  bills: (->
    @get("cashDenominations").filterBy "kind", "bill"
  ).property("cashDenominations")

  coins: (->
    @get("cashDenominations").filterBy "kind", "coin"
  ).property("cashDenominations")

# bill or coin items
  billItems: (->
    @get("model.cashDenominationItems").filterBy "cashDenomination.kind", "bill"
  ).property("model.cashDenominationItems.@each")

  coinItems: (->
    @get("model.cashDenominationItems").filterBy "cashDenomination.kind", "coin"
  ).property("model.cashDenominationItems.@each")

# aggregate operations
  totalValueFor: (kind) ->
    Ember.debug "computing totalValueFor:#{kind}"
    @get("#{kind}Items").reduce (prev, cashDenominationItem) ->
      prev + cashDenominationItem.get("totalPrice")
    , 0

  countFor: (kind) ->
    Ember.debug "computing countFor:#{kind}"
    @get("#{kind}Items").reduce (prev, cashDenominationItem) ->
      prev + cashDenominationItem.get("cantidad")
    , 0

# aggregate properties
  billTotalValue: (-> @totalValueFor("bill") )
  .property("billItems.@each.cantidad")

  coinTotalValue: (-> @totalValueFor("coin") )
  .property("coinItems.@each.cantidad")

  billCount: (-> @countFor("bill") )
  .property("billItems.@each.cantidad")

  coinCount: (-> @countFor("coin") )
  .property("coinItems.@each.cantidad")
