Bandango.CashDenomination = DS.Model.extend
  price:                 DS.attr()
  kind:                  DS.attr()

  cashDenominationItems: DS.hasMany("cashDenominationItem")
