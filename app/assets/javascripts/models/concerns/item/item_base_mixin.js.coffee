Bandango.ItemBaseMixin = Ember.Mixin.create
# summary enumerables
  ivaZeroFor: (orderType) ->
    return 0 if @get("iva")
    @get("base#{orderType}")

  ivaZeroVenta: (-> @ivaZeroFor("Venta") ).property("baseVenta", "iva")
  ivaZeroCompra: (-> @ivaZeroFor("Compra") ).property("baseCompra", "iva")

  iceFor: (orderType) ->
    return 0 unless @get("ice")
    base = @get("base#{orderType}")
    ice = base * (@get("iceTarifa") / 100)
    Bandango.numberForCurrencyHelper ice

  iceVenta: (-> @iceFor("Venta") ).property("baseVenta", "ice", "iceTarifa")
  iceCompra: (-> @iceFor("Compra") ).property("baseCompra", "ice", "iceTarifa")

  ivaTwelveFor: (orderType) ->
    return 0 unless @get("iva")
    base = @get("base#{orderType}")
    iva = base * (@get("ivaTarifa") / 100)
    Bandango.numberForCurrencyHelper iva

  ivaTwelveVenta: (-> @ivaTwelveFor("Venta") ).property("baseVenta", "iva", "ivaTarifa")
  ivaTwelveCompra: (-> @ivaTwelveFor("Compra") ).property("baseCompra", "iva", "ivaTarifa")

  iceTotalFor: (orderType) ->
    return 0 unless @get("ice")
    base = @get("base#{orderType}")
    ice = base * (@get("iceTarifa") / 100)
    Bandango.numberForCurrencyHelper ice

  iceTotalVenta: (-> @iceTotalFor("Venta") ).property("baseVenta", "ice", "iceTarifa")
  iceTotalCompra: (-> @iceTotalFor("Compra") ).property("baseCompra", "ice", "iceTarifa")

  totalPriceFor: (orderType) ->
    price = @get("base#{orderType}")
    if @get("iva")
      price += @get("ivaTwelve#{orderType}")
    if @get("ice")
      price += @get("iceTotal#{orderType}")
    Bandango.numberForCurrencyHelper price

  totalPriceVenta: (-> @totalPriceFor("Venta") ).property("baseVenta", "iva", "ivaTarifa", "ice", "iceTarifa")
  totalPriceCompra: (-> @totalPriceFor("Compra") ).property("baseCompra", "iva", "ivaTarifa", "ice", "iceTarifa")
