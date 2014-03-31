Bandango.cierreCajaInteractorHelper =
  prepareCierreCaja: (options) ->
    # prepare with empty cashDenominationItems
    cierreCaja = options.cierreCaja
    cashDenominations = options.cashDenominations
    store = options.store

    for cashDenomination in cashDenominations.get("content")
      cashDenominationItem = store.createRecord("cashDenominationItem", cashDenomination: cashDenomination, cierreCaja: cierreCaja, cantidad: 0)
