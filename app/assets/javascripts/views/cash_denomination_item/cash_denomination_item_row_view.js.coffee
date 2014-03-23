Bandango.CashDenominationItemRowView = Ember.View.extend
  tagName: "tr"
  templateName: "cash_denomination_item/row"
  classNames: "cash-denomination-row"
  cierreCajaBinding: "controller.model"

  model: (->
    cashDenomination = @get("cashDenomination")
    model = @get("cierreCaja.cashDenominationItems").find (item) ->
      item.get("cashDenomination.price") == cashDenomination.get("price") and item.get("cashDenomination.kind") == cashDenomination.get("kind")
    unless model
      model = @get("controller").get("store").createRecord "cashDenominationItem", cashDenomination: cashDenomination, cierreCaja: @get("cierreCaja"), cantidad: 0
    model
  ).property("cierreCaja")
