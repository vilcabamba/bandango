Bandango.ItemBaseMixin = Ember.Mixin.create
  ivaZeroVenta: (->
    return 0 if @get("iva")
    @get("baseVenta")
  ).property("baseVenta", "iva")
  ivaZeroCompra: (->
    return 0 if @get("iva")
    @get("baseCompra")
  ).property("baseCompra", "iva")

  ivaTwelveVenta: (->
    return 0 unless @get("iva")
    @get("baseVenta") * (@get("ivaTarifa") / 100)
  ).property("baseVenta", "iva", "ivaTarifa")
  ivaTwelveCompra: (->
    return 0 unless @get("iva")
    @get("baseCompra") * (@get("ivaTarifa") / 100)
  ).property("baseCompra", "iva", "ivaTarifa")

  iceTotalVenta: (->
    return 0 unless @get("ice")
    @get("baseVenta") * (@get("iceTarifa") / 100)
  ).property("baseVenta", "ice", "iceTarifa")
  iceTotalCompra: (->
    return 0 unless @get("ice")
    @get("baseCompra") * (@get("iceTarifa") / 100)
  ).property("baseCompra", "ice", "iceTarifa")

  totalPriceVenta: (->
    price = @get("baseVenta")
    if @get("iva")
      price += @get("ivaTwelveVenta")
    if @get("ice")
      price += @get("iceTotalVenta")
    price
  ).property("baseVenta", "iva", "ivaTarifa", "ice", "iceTarifa")
  totalPriceCompra: (->
    price = @get("baseCompra")
    if @get("iva")
      price += @get("ivaTwelveVenta")
    if @get("ice")
      price += @get("iceTotalVenta")
    price
  ).property("baseCompra", "iva", "ivaTarifa", "ice", "iceTarifa")
